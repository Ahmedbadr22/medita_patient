import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';

import '../models/first_aid_model.dart';

List firstAidData = [
  FirstAidModel(
    name: 'CPR',
    subtitle:
        'Administer cardiopulmonary resuscitation (CPR) to help someone with breathing. Necessary training would be helpful in understanding CPR.',
    videoUrl: ImageAsset.cprVid,
    imageUrl: ImageAsset.cprImage,
    color: Colors.green.shade100.withOpacity(0.6),
    description:
        '🔵 Kneel next to the person and place the heel of your hand on the breastbone at the centre of their chest. Place the palm of your other hand on top of the hand that\'s on their chest and interlock your fingers.\n\n🔵 Position yourself so your shoulders are directly above your hands. \n\n🔵 Using your body weight (not just your arms), press straight down by 5 to 6cm (2 to 2.5 inches) on their chest.\n\n🔵 Keeping your hands on their chest, release the compression and allow their chest to return to its original position.\n\n🔵 Repeat these compressions at a rate of 100 to 120 times a minute until an ambulance arrives or for as long as you can.',
  ),
  FirstAidModel(
    name: 'Sprain',
    subtitle:
        'Applying ice blocks, you can help people with sprains. If the swelling doesn\'t improve, specialized care will be required.',
    videoUrl: ImageAsset.sprainVid,
    imageUrl: ImageAsset.sprainImage,
    color: Colors.blue.shade100.withOpacity(0.6),
    description:
        '🟠 Rest the patient and the injury.\n\n🟠 Apply an icepack (cold compress) wrapped in a wet cloth to the injury for 15 minutes every 2 hours for 24 hours and then for 15 minutes every 4 hours for 24 hours.\n\n🟠 Apply a compression elastic bandage firmly to the injury that extends well beyond the injury.\n\n🟠 Elevate the injured part.\n\n🟠 Seek medical aid.\n',
  ),
  FirstAidModel(
      subtitle:
          'Apply pressure: Use a clean cloth or bandage to apply direct pressure to the wound. If possible, elevate the affected limb above the level of the heart to slow down the bleeding.',
      videoUrl: ImageAsset.neakBreakVid,
      name: 'Neck Break',
      imageUrl: ImageAsset.neckImage,
      color: Colors.orange.shade100.withOpacity(0.6),
      description:
          '⚫ Calm the patient and loosen tight clothing.\n\n⚫ Do not move the patient unless in danger.\n\n⚫ Support head, neck and spine in a neutral position at all times to prevent twisting or bending movements.\n\n⚫ If the ambulance is delayed, apply a cervical collar, if trained to do so, to minimise neck movement.\n\n⚫ Ensure an ambulance has been called: triple zero (123).'),
  FirstAidModel(
      subtitle:
          'If someone is choking and unable to breathe, the first thing to do is to call emergency services or have someone else do it. While waiting for help, follow these steps: Stand behind the person.',
      videoUrl: ImageAsset.chokingVid,
      name: 'Choking',
      imageUrl: ImageAsset.chokingImage,
      color: Colors.purple.shade100.withOpacity(0.6),
      description:
          '🟣 Stand behind them and slightly to one side. Support their chest with 1 hand. Lean them forward so the object blocking their airway will come out of their mouth, rather than moving further down.\n\n🟣 Give up to 5 sharp blows between their shoulder blades with the heel of your hand. The heel is between the palm of your hand and your wrist.\n\n🟣 Check if the blockage has cleared.\n\n🟣 If not, give up to 5 abdominal thrusts.\n'),
];
