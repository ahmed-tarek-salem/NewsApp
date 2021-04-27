import 'package:NewsApp/models/category_models.dart';

List <CategoryModel> getCategories(){
  List <CategoryModel> listOfCats=[];
  CategoryModel singleCat= CategoryModel();
  singleCat.nameOfCategory= 'general';
  listOfCats.add(singleCat);

   singleCat= CategoryModel();
  singleCat.nameOfCategory= 'health';
  listOfCats.add(singleCat);

   singleCat= CategoryModel();
  singleCat.nameOfCategory= 'science';
  listOfCats.add(singleCat);


   singleCat= CategoryModel();
  singleCat.nameOfCategory= 'sports';
  listOfCats.add(singleCat);


   singleCat= CategoryModel();
  singleCat.nameOfCategory= 'technology';
  listOfCats.add(singleCat);

   singleCat= CategoryModel();
  singleCat.nameOfCategory= 'business';
  listOfCats.add(singleCat);

  return listOfCats;
}