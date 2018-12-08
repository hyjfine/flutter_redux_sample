Language: [中文简体](https://github.com/hyjfine/flutter_redux_sample) | [English](https://github.com/hyjfine/flutter_redux_sample/blob/master/README-EN.md)
# flutter_redux_sample
[![Build Status](https://travis-ci.org/hyjfine/flutter_redux_sample.svg?branch=master)](https://travis-ci.org/hyjfine/flutter_redux_sample)

  <img align="right" src ="http://me.wozaihui.com/hyj-doc-flutter-demo-run.gif" alt="Todo List">

Todo List example, modularizing MVVM, managing data and state with Redux.  Sample show how to make a reasonable network to call API,  processing data, refresh the view reactive. also tell what does Redux do and how it works in a Flutter app.

### File Structure

  <img align="left" width="375" height="327" src="http://me.wozaihui.com/hyj-doc-flutter-demo-files.jpg">

### Branch

  - master：call API with a static function ，The advantage is that the structure is simple, but it is not possible to write unit tests for the API, which is suitable for personal rapid development experience.
  - plus：Redux joins MiddleWare, and Reducer uses combineReducers to cut into smaller granularity, making it easier to write UT for the reducer. The complexity is somewhat improved, but the structure is more rigorous, and it is convenient to use a more comprehensive UT to ensure the quality of the software in the iteration.

### Library Dependency

- [redux: ^3.0.0](https://github.com/brianegan/redux)
- [flutter_redux: ^0.5.2](https://github.com/brianegan/flutter_redux)
- [dio: ^1.0.4](https://github.com/flutterchina/dio)

### Setup & Run

```
//1.pull code
git clone git@github.com:hyjfine/flutter_redux_sample.git
//2.check env
flutter channel stable
//3.install lib
flutter packges get
//4.run
open project by Android Studio or VS code，just run app!        
```

### License

  MIT licensed，star & PR 👏

### Attribution

Thanks to the author of Redux with dart and his  [flutter_architecture_samples](https://github.com/brianegan/flutter_architecture_samples)。