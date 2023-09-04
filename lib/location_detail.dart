//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/location.dart';
import 'styles.dart';
//import 'mocks/mock_location.dart';


class LocationDetail extends StatefulWidget
{
final int locationID;
LocationDetail(this.locationID);

  @override
  createState()=> _LocationDetailState(this.locationID);
  }
class _LocationDetailState extends State<LocationDetail>{
  late final int locationID;
  Location location =Location.blank();
  _LocationDetailState(this.locationID);
  @override
  void initState(){
    super.initState();
    loadData();  
    }
    
  @override
  Widget build (BuildContext context){
    //var location =MockLocation.fetch(this.locationID);
    return Scaffold(
      appBar : AppBar(title: Text(location.name, style: Styles.navBarTitle,),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _renderBody(context, location),),
      ) 
    );
  }
  loadData() async{
      final location =await Location.fetchByID(this.locationID);
      if(mounted){
      setState((){
        this.location=location;
      });
    }
    }
  List<Widget> _renderBody(BuildContext context, Location location){
    var result =<Widget>[];
    result.add(_bannerImage(location.url, 200.0));
    result.addAll(_renderFacts(context,location));
    return result;
  }

  List<Widget> _renderFacts(BuildContext Context, Location location){
    final result=  <Widget>[];
    for( int i=0; i<(location.facts ??[]).length;i++){
      result.add(_selectionTitle(location.facts![i].title));
      result.add(_selectionText(location.facts![i].text));
    }
    return result;
    }
    Widget  _selectionTitle(String text){
      return Container(
        padding: EdgeInsets.fromLTRB(25.0, 20.0, 15.0, 10.0),
        child: Text(text,
          
        textAlign: TextAlign.left,
        style: Styles.headerLarge,
        ),
      );
    }
    Widget  _selectionText(String text){
      return Container( padding: EdgeInsets.fromLTRB(25.0, 20.0, 15.0, 10.0),child: Text(text, style: Styles.textDefault,));
    }
    Widget _bannerImage(String url, double height){
      //Image image;
      
      try{
return Container(
  constraints: BoxConstraints.tightFor(height:height),

  child:Image.network(url, fit: BoxFit.fitWidth)
);
      }
      catch(e){
        print("could not load image $url");
      }
      return Container();
    }
  }
