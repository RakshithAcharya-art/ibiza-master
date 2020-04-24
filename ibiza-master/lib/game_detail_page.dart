import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class GameDetailPage extends StatefulWidget {
  final Map detailsFirebase;
  GameDetailPage({this.detailsFirebase});
  @override
  _GameDetailPageState createState() => _GameDetailPageState.gameDetailPage(detailsFirebase: detailsFirebase);

}

class _GameDetailPageState extends State<GameDetailPage> {

  Map detailsFirebase;
  _GameDetailPageState.gameDetailPage({this.detailsFirebase});

  double actionButtonSize=13;
  double raisedButtonFontSize=11;
  double editableWordSize=18;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 80,
      color: Colors.teal,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                    height: 50,
                    color: Colors.yellow,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(child: IconButton(
                          icon: Icon(Icons.drag_handle),
                          iconSize: actionButtonSize,
                          onPressed: (){},
                        )
                        ),
                        Expanded(child: IconButton(
                          icon: Icon(Icons.delete),
                          iconSize: actionButtonSize,
                          onPressed: (){},
                        )
                        ),
                        Expanded(child: IconButton(
                          icon: Icon(Icons.add),
                          iconSize: actionButtonSize,
                          onPressed: (){},
                        )
                        ),
                        SizedBox(width: 5,),
                        Expanded(
                            child: GestureDetector(
                              child: Container(
                                child: Text("Q"),), onTap: () {},
                            )
                        ),
                      ],
                    )
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                    height: 60,
                    color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        SizedBox(width: 2,),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(child: RaisedButton(child: Text(
                                      "Sentence",
                                      style: TextStyle(fontSize: raisedButtonFontSize),),
                                      onPressed: () {
                                      getDialog("SENTENCE");
                                      },
                                    )
                                    ),
                                    Expanded(child: RaisedButton(child: Text(
                                      "Name", style: TextStyle(fontSize: raisedButtonFontSize),),
                                      onPressed: () {
                                        getDialog("NAME");
                                      }
                                      )
                                    ),

                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(child: RaisedButton(
                                        child: Text("Image", style: TextStyle(fontSize: raisedButtonFontSize),),
                                      onPressed: () {
                                        getDialog("IMAGE");
                                      }
                                      )
                                    ),
                                    Expanded(child: RaisedButton(
                                        child: Text("Audio", style: TextStyle(fontSize: raisedButtonFontSize),),
                                      onPressed: () {
                                        getDialog("AUDIO");
                                      }
                                      )
                                    ),
                                    Expanded(child: RaisedButton(
                                        child: Text("Word", style: TextStyle(fontSize: raisedButtonFontSize),),
                                      onPressed: () {
                                        getDialog("WORD");
                                      }
                                      )
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  getDialog(String name) {

     {
       return showDialog(
           context: context,
           builder: (context) {
             return Dialog(
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(40)),
                 elevation: 16,
                 child: Container(
                   height: 400.0,
                   width: 360.0,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: <Widget>[
                       SizedBox(height: 10),
                       Text(name,style: TextStyle(fontSize: 30,color: Colors.red),),
                       SizedBox(height: 30),
                       if(name=='SENTENCE' || name=='NAME' || name=='WORD')
                         Container(
                           child: (name=="SENTENCE") ?
                          (Text(detailsFirebase['sentence'],
                             style: TextStyle(fontSize: editableWordSize)
                          )
                          ): //Ternary operator
                           ((name=="NAME")?
                           Text(detailsFirebase['name'],
                           style: TextStyle(fontSize: editableWordSize),
                           ):
                           Text(detailsFirebase['words'],
                           style: TextStyle(fontSize: editableWordSize),
                           )
                           )// Ternary operator
                         )
                       else if(name=='IMAGE')
                         Container(
                         child: Text("Image"),
                         )
                       else if(name=='AUDIO')
                         Container(
                           child: Text("Audio should be added here"),
                         ),
                       SizedBox(height: 30,),
                       RaisedButton(
                         child: Text("EDIT CHANGES"),
                         onPressed: (){},
                       )
                     ],
                   ),
                 )
             );
           }
       );
     }
  }
}