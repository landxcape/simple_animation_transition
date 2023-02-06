import 'package:flutter/material.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData(useMaterial3: true),
      home: const SimpleAnimationsPreview(),
    );
  }
}

class SimpleAnimationsPreview extends StatelessWidget {
  const SimpleAnimationsPreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Animation Widgets'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const SimpleAnimationsPreview()),
            ),
            icon: const Icon(Icons.replay_outlined),
          ),
        ],
      ),
      body: SizedBox(
      width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FadeAnimatedWidget(
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'Fade Animation',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
            ),
            SlideAnimatedWidget(
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'Slide Animation',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
            ),
            ScaleAnimatedWidget(
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'Scale Animation',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
            ),
            FadedSlideAnimationWidget(
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'Faded Slide Animation',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
            ),
            FadedScaleAnimationWidget(
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'Faded Scale Animation',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
