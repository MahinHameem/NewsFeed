import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_feed_app/data/data_sources/remote_data_source.dart';
import 'package:news_feed_app/presentation/bloc/news/news_bloc.dart';
import 'package:news_feed_app/presentation/view/content/content_page.dart';
import 'package:news_feed_app/presentation/view/news_feed/widgets/news_box.dart';
import 'package:news_feed_app/presentation/view/news_feed/widgets/popup_dialog.dart';
import 'package:news_feed_app/presentation/view/settings/settings_page.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  bool themeStatus=true;
  RemoteDataSource remoteDataSource = RemoteDataSource();


  @override
  void initState() {
    BlocProvider.of<NewsBloc>(context).add(FetchArticlesEvent());
  }

  void toggleThemeStatus (){
    if(themeStatus==true){
      setState(() {
       themeStatus=false;
       themeStatus=themeStatus;
       print(themeStatus);
      });
    }
    else{
      setState(() {
        themeStatus=true;
        themeStatus=themeStatus;
        print(themeStatus);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ShowPopupDialog(context);
        },
        backgroundColor: themeStatus?Colors.yellowAccent:Colors.cyan,
        child: Icon(Icons.search,
          color: themeStatus?Colors.black:Colors.white,),
      ),
      backgroundColor: themeStatus?Colors.black:Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            BlocProvider.of<NewsBloc>(context).add(SortEvent());
          }, icon: Icon(Icons.sort_by_alpha,
            color: themeStatus?Colors.white:Colors.black,)),

          IconButton(
              onPressed: () {
                toggleThemeStatus();
              },
              icon: Icon(
                themeStatus?Icons.dark_mode:Icons.sunny,
                color: themeStatus? Colors.cyan:Colors.orange,
              )),

          IconButton(
              onPressed: () {
                BlocProvider.of<NewsBloc>(context).add(FetchArticlesEvent());
              },
              icon: Icon(
                Icons.refresh,
                color: themeStatus?Colors.white:Colors.black,
              )),



          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => SettingsPage(themeStatus: themeStatus),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.settings,
                color: themeStatus?Colors.white:Colors.black,
              )),

        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Icon(
              Icons.newspaper,
              color: Color(0xff2acec8),
            ),
            Text(
              'News Feed',
              style: TextStyle(
                color: themeStatus?Colors.white:Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
        if (state is NewsLoadingState) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Color(0xff2acec8),
              ),
            ],
          ));
        } else if (state is NewsLoadedState) {
          return ListView.builder(
              itemCount: state.articleList.length,
              itemBuilder: (context, index) {
                return NewsBoxWidget(
                  titleColor: themeStatus?Colors.white:Colors.black,
                  authorColor: themeStatus?Color(0xff80ffff):Color(0xff126889),
                  containerColor: themeStatus?Color(0xff262525):Color(0xfff3f1f1),
                  descriptionColor: themeStatus?Colors.white:Colors.black,
                  descriptionTextColor: themeStatus?Colors.white:Colors.black,
                  author: state.articleList[index].author,
                  title: state.articleList[index].title,
                  description: state.articleList[index].description,
                  url: state.articleList[index].url,
                  urlToImage: state.articleList[index].urlToImage,
                  publishedAt: state.articleList[index].publishedAt,
                  content: state.articleList[index].content,
                  viewClick: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            ContentViewPage(
                              themeStatus: themeStatus,
                                author: state.articleList[index].author,
                                title: state.articleList[index].title,
                                description:
                                    state.articleList[index].description,
                                url: state.articleList[index].url,
                                urlToImage: state.articleList[index].urlToImage,
                                publishedAt:
                                    state.articleList[index].publishedAt,
                                content: state.articleList[index].content),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                );
              });
        }

        else if(state is NewsFailedState){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.warning,color: Colors.red,size: 30,),
                Text('Something went wrong. Try refreshing...',
                style: TextStyle(
                  color:themeStatus?Colors.white:Colors.black,
                ),
                ),
              ],
            ),
          );
        }
        else if(state is NewsSortedState){
          return ListView.builder(
              itemCount: state.articleList.length,
              itemBuilder: (context, index) {
                return NewsBoxWidget(
                  titleColor: themeStatus?Colors.white:Colors.black,
                  authorColor: themeStatus?Colors.white:Colors.black,
                  containerColor: themeStatus?Color(0xff262525):Color(0xfff3f1f1),
                  descriptionColor: themeStatus?Colors.white:Colors.black,
                  descriptionTextColor: themeStatus?Colors.white:Colors.black,
                  author: state.articleList[index].author,
                  title: state.articleList[index].title,
                  description: state.articleList[index].description,
                  url: state.articleList[index].url,
                  urlToImage: state.articleList[index].urlToImage,
                  publishedAt: state.articleList[index].publishedAt,
                  content: state.articleList[index].content,
                  viewClick: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            ContentViewPage(
                              themeStatus: themeStatus,
                                author: state.articleList[index].author,
                                title: state.articleList[index].title,
                                description:
                                state.articleList[index].description,
                                url: state.articleList[index].url,
                                urlToImage: state.articleList[index].urlToImage,
                                publishedAt:
                                state.articleList[index].publishedAt,
                                content: state.articleList[index].content),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                );
              });
        }
        else if(state is NewsSearchNotFoundState){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.search_off_outlined,  color: themeStatus?Colors.white:Colors.black,),
                Text('No results found',
                style: TextStyle(
                  color: themeStatus?Colors.white:Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ],
            ),
          );
        }
        else {
          return Container(
            height: 100,
            width: 100,
            color: Colors.lightGreenAccent,
          );
        }
      }),
    );
  }
}
