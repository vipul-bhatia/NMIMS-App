import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../screens/home_screen.dart';

class OnboardingScreenWidget extends StatefulWidget {
  const OnboardingScreenWidget({Key? key}) : super(key: key);

  @override
  _OnboardingScreenWidgetState createState() => _OnboardingScreenWidgetState();
}

class _OnboardingScreenWidgetState extends State<OnboardingScreenWidget> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        title: Text(
          'Welcome',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Color(0xFF0F1113),
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 500,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12, 12, 12, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                             Container(
                               child: LottieBuilder.asset('Assets/space-runner.json',  width: 300,
                                  height: 300,
                                  fit: BoxFit.cover,),
                             ),
                              
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 24,0,0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'CAMPUS COMPANION',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF0F1113),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Ease. On your finger tips.',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF57636C),
                                          fontSize: 25,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: AlignmentDirectional(0, 1),
                      //   child: Padding(
                      //     padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      //     child: SmoothPageIndicator(
                      //       controller: pageViewController ??=
                      //           PageController(initialPage: 0),
                      //       count: 3,
                      //       axisDirection: Axis.horizontal,
                      //       onDotClicked: (i) {
                      //         pageViewController!.animateToPage(
                      //           i,
                      //           duration: Duration(milliseconds: 500),
                      //           curve: Curves.ease,
                      //         );
                      //       },
                            // effect: ExpandingDotsEffect(
                            //   expansionFactor: 2,
                            //   spacing: 8,
                            //   radius: 16,
                            //   dotWidth: 16,
                            //   dotHeight: 4,
                            //   dotColor: Color(0xFFE0E3E7),
                            //   activeDotColor: Color(0xFF0F1113),
                            //   paintStyle: PaintingStyle.fill,
                            // ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF4B39EF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                      textStyle: TextStyle(
                        fontFamily: 'Outfit',
                        color: Color(0xFFE0E3E7),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: (){ Navigator.pushReplacementNamed(context, '/home');},
                    label: Text('Login'),
                    icon: Icon(
                      Icons.login,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0F1113),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                      textStyle: TextStyle(
                        fontFamily: 'Outfit',
                        color: Color(0xFFE0E3E7),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    label: Text('Register'),
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
