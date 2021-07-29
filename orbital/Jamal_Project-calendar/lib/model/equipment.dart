enum Equipment {
  noEquip,
  barbell,
  dumbbell,
  dipBar,
  pullUpBar,
  kettlebell,
  resistanceBand,
  cables,
}

String getEquipment(Equipment e) {
  switch (e) {
    case Equipment.noEquip:
      return "Bodyweight";

      break;
    case Equipment.barbell:
      return 'Barbell';
      break;
    case Equipment.cables:
      return 'Cables';
      break;

    case Equipment.dumbbell:
      return 'Dumbbell';
      break;
    case Equipment.dipBar:
      return 'Dip Bar';
      break;
    case Equipment.pullUpBar:
      return 'Pull Up Bar';
      break;
    case Equipment.resistanceBand:
      return 'Resistance Band';
      break;
    case Equipment.kettlebell:
      return 'Kettlebell';
      break;
  }
  return 'Bodyweight';
}
