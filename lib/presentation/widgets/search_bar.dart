import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../bloc/news_bloc.dart';

class Searchbar extends StatefulWidget {
   const Searchbar({super.key});
   static TextEditingController searchController = TextEditingController(text: '');

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {




  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          decoration:  BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(10)
          ),
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Enter something",
              hintStyle: GoogleFonts.lato(),
              border: InputBorder.none
            ),
            controller: Searchbar.searchController,
          ),
        )),
        InkWell(
          onTap: (){
            BlocProvider.of<NewsBloc>(context).add(FetchNewsEvent());
          },
          child: Container(
            height: 45,
            width: 45,
            decoration:  BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(10)
            ),
            child: const Icon(
              Icons.search
            ),
          ),
        )
      ],
    );
  }

}
