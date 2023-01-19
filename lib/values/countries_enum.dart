enum Country { india, australia, usa, russia }

extension CountriesHelper on Country {
  String countryCode() {
    final String countryName;

    switch (this) {
      case Country.india:
        {
          countryName = 'in';
        }
        break;
      case Country.australia:
        {
          countryName = 'au';
        }
        break;
      case Country.usa:
        {
          countryName = 'us';
        }
        break;
      default:
        {
          countryName = 'ru';
        }
        break;
    }
    return countryName;
  }
}
