import 'package:flutter/material.dart';

// Show search
class MyDelegate extends SearchDelegate
{
  @override
  List<Widget>? buildActions(BuildContext context)
  {
    // return [IconButton(onPressed: () =>
    // {
    //   if(query.isEmpty)
    //     close(context, null)
    //   else
    //     query = ""
    // }, icon: const Icon(Icons.clear))];
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context)
  {
    return IconButton(onPressed: () => { close(context, null) }, icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context)
  {
    return const Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    return const Text("No one");
  }
}