enum Environment {
  dev,
  uat,
  live,
}

enum AppTab {
  dashboard,
  budgets,
  events,
  cards,
}

/// Because we can add category dynamically so we need a few color
/// as sample so that user can select from them
enum CategoryColor {
  color1, //  COLOR_1
  color2, //  COLOR_2
  color3, //  COLOR_3
}

/// Because we can add category dynamically so we need a few icon
/// as sample so that user can select from them
enum CategoryIcon {
  car, //  CAR
  entertainment, //  ENTERTAINMENT
  fingerprint, //  FINGERPRINT
}

enum BudgetStatus {
  good,
  bad,
}
