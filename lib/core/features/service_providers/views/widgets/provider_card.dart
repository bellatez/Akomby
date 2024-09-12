import 'package:Akombi/core/features/authentication/sign_up/page/sign_up_page.dart';
import 'package:flutter/material.dart';

class ProviderCardWidget extends StatelessWidget {

  final fullName, age, quarter, language, stayOption, typeOfService, profilePhotoUrl;

  const ProviderCardWidget( {this.stayOption, this.typeOfService, this.profilePhotoUrl, this.fullName, this.age, this.quarter, this.language});


  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          margin: EdgeInsets.only(left:50.0),
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Card(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 54.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Text(fullName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.white))
                        ),
                        Text(typeOfService)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Age: ${age} years old"),
                        Text("Quarter: ${quarter}"),
                        Text("Lang: ${language}"),
                        Text("Stay Option: ${stayOption}")
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              //       the materialPageroute tells the compiler how to handle the stateless widget view for the next page
              //       It is also responsible for the back arrow button found on the appbar of the view
              MaterialPageRoute(
                  builder: (context) => SignUpPage()
                      // MovieListViewDetails(movieName: movie.Title, movie: movie)
              )
          );
        }
    );
  }
}
