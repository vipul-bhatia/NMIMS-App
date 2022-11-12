import 'package:app/newswidgets/articleModel.dart';
import 'package:app/newswidgets/article_view.dart';
import 'package:app/newswidgets/news.dart';
import 'package:flutter/material.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({required this.category});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
List<ArticleModel> articles = <ArticleModel>[];
bool _loading = true;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews() ;
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(
         iconTheme: IconThemeData(color: Color(0xFF4B39EF)),
        backgroundColor: Colors.white,
        title: Text(
    'Latest News',
    style: TextStyle(
          fontFamily: 'Lexend Deca',
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
  ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
            child: Container(
                  child: Column(
          children: [
             //Blogs
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].url,
                            );
                          },
                        ),
                      ),
                    ),
          ],
                  )
                ),
          ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  BlogTile({required this.imageUrl, required this.title, required this.desc, required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl: imageUrl,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)),
            Text(title, style: TextStyle(fontSize: 17, color: Colors.black87,fontWeight: FontWeight.w600),),
            SizedBox(height: 8,),
            Text(desc, style: TextStyle(color: Colors.black54,),),
          ],
        ),
      ),
    );
  }
}
