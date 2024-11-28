class City{
  bool isSelected;
  final String city;
  final String department;
  final bool isDefault;

  City({required this.isSelected, required this.city, required this.department, required this.isDefault});

  //Lista de las ciudades
  static List<City> citiesList = [
    City(
        isSelected: true,
        city: 'Pasto,CO',
        department: 'Nariño',
        isDefault: true),
    City(
        isSelected: false,
        city: 'Bogota,CO',
        department: 'Cundinamarca',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Medellin,CO',
        department: 'Antioquia',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Cali,CO',
        department: 'Valle del Cauca',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Barranquilla,CO',
        department: 'Atlántico',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Cartagena,CO',
        department: 'Bolívar',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Cúcuta,CO',
        department: 'Norte de Santander',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Bucaramanga,CO',
        department: 'Santander',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Pereira,CO',
        department: 'Risaralda',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Santa Marta,CO',
        department: 'Magdalena',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Ibagué,CO',
        department: 'Tolima',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Manizales,CO',
        department: 'Caldas',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Neiva,CO',
        department: 'Huila',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Villavicencio,CO',
        department: 'Meta',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Armenia,CO',
        department: 'Quindío',
        isDefault: false),
  ];

  //Importar las ciudades seleccionadas
  static List<City> getSelectedCities(){
    return citiesList.where((city) => city.isSelected || city.isDefault).toList();
  }
}
