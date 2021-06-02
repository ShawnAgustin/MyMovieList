enum Status { NONE, PLANNED, COMPLETED, PRIVATE }

class MovieStatus {
  static const String NONE = 'None';
  static const String PLANNED = 'Planned';
  static const String COMPLETED = 'Completed';
  static const String PRIVATE = 'Private';

  static String getStatusName(Status status) {
    switch (status) { 
      case Status.PLANNED:
        return PLANNED;
        break;
      case Status.COMPLETED:
        return COMPLETED;
        break;
      case Status.PRIVATE:
        return PRIVATE;
        break;
      default:
        return NONE;
    }
  }
}
