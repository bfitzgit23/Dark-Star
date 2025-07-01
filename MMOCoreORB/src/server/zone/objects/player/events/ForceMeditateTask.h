/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions. */


#ifndef FORCEMEDITATETASK_H_
#define FORCEMEDITATETASK_H_

#include "engine/engine.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/chat/StringIdChatParameter.h"
#include "templates/params/creature/CreatureAttribute.h"

class ForceMeditateTask: public Task {
	ManagedReference<CreatureObject*> player;
	String moodString;

public:
	ForceMeditateTask(CreatureObject* pl) {
		player = pl;
	}

	void setMoodString(const String& ms) {
		moodString = ms;
	}

	String getMoodString() {
		return moodString;
	}

	void run() {
		Locker playerLocker(player);

		try {
			Reference<ForceMeditateTask*> fmeditateTask = player->getPendingTask("forcemeditate").castTo<ForceMeditateTask*>();

			if (!player->isMeditating()){
				return;
			}

			if (player->hasSkill("force_discipline_enhancements_novice")){

				// -----------------------------------------------------------------
				// NEW LOGIC: PASSIVE BATTLE FATIGUE (SHOCK WOUND) HEALING
				// -----------------------------------------------------------------

				// Check if the player has any battle fatigue.
				if (player->getShockWounds() > 0) {
					// Heal a random amount, same as the wound healing logic.
					int fatigueHealAmount = 40 + System::random(20);

					// Cap the heal at the amount of fatigue the player actually has.
					fatigueHealAmount = Math::min((int)player->getShockWounds(), fatigueHealAmount);

					// Heal the battle fatigue by adding a negative value to the shock wounds.
					player->addShockWounds(-fatigueHealAmount, true, false);

					// *** CORRECTED LINE HERE ***
					// Send a raw system message instead of using the STF file to avoid the "jedi_spam" error.
					String message = "Your meditation cleanses " + String::valueOf(fatigueHealAmount) + " of your battle fatigue.";
					player->sendSystemMessage(message);
				}


				// -----------------------------------------------------------------
				// EXISTING LOGIC: HEAL REGULAR WOUNDS (UNCHANGED)
				// -----------------------------------------------------------------
				StringIdChatParameter healParams;
				//Here we are checking to see which pools have wounds, and we add them to a vector...
				Vector<uint8> woundedPools;
				Vector<uint8> hamPools;
				Vector<uint8> regenPools;
				for (uint8 i = 0; i < 9; ++i) {
					if (player->getWounds(i) > 0) {
						woundedPools.add(i);
						if ((i == 0) | (i == 3) | (i == 6)) { // HAM Pool
							hamPools.add(i);
						}
						else if ((i == 2) | (i == 5) | (i == 8)) { // Regen Pool
							regenPools.add(i);
						}
					}
				}

				if (woundedPools.size() > 0) {

					// Select a random Attribute that has wounds from HAM first, then regen pools, then remaining secondary pools
					uint8 pool;
					if (hamPools.size() > 0) {
						pool = hamPools.get(System::random(hamPools.size() - 1));
					}
					else if (regenPools.size() > 0) {
							pool = regenPools.get(System::random(regenPools.size() - 1));
					}
					else {
							pool = woundedPools.get(System::random(woundedPools.size() - 1));
					}

					int wounds = player->getWounds(pool);
					int heal = 40 + System::random(20);

					//Cap the heal at the amount of wounds the creature has.
					heal = Math::min(wounds, heal);

					player->healWound(player, pool, heal, true, false);

					// Sending System healing Message (wounds)
					healParams.setStringId("teraskasi", "prose_curewound"); // [meditation] Your %TO wounds heal by %DI points.
					healParams.setTO(CreatureAttribute::getName(pool));
					healParams.setDI(heal);
					player->sendSystemMessage(healParams);
				}
			}

			player->playEffect("clienteffect/pl_force_meditate_self.cef", "");
			if (fmeditateTask != nullptr)
				fmeditateTask->reschedule(5000);
			else
				fmeditateTask->schedule(5000);

		} catch (Exception& e) {
			player->error("unreported exception caught in ForceMeditateTask::activate");
		}
	}

};

#endif /* FORCEMEDITATETASK_H_ */
