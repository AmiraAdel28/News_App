import 'package:flutter/material.dart';
import 'package:news/models/SourcesModel.dart';
import 'package:news/modules/home/news_widget.dart';
import 'package:news/modules/home/tab_item.dart';

class TabsController extends StatefulWidget {

List<Sources> sources;
int selectedItem=0;
TabsController(this.sources,);

  @override
  State<TabsController> createState() => _TabsControllerState();
}

class _TabsControllerState extends State<TabsController> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(length: widget.sources.length,
            child: TabBar(
              onTap: (index){
              widget.selectedItem=index;
                setState(() {
                });
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs:
            widget.sources.map((oneSource) => TabItem(oneSource,
            widget.selectedItem==widget.sources.indexOf(oneSource)
            )).toList(),

            )
        ),
       Expanded(child: NewsData(widget.sources[widget.selectedItem]))

      ],
    );
  }
}
