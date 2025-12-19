part of 'app_theme.dart';

IconButtonThemeData get _iconButtonTheme => IconButtonThemeData(
    style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(Size.square(kMinInteractiveDimension)),
        padding: WidgetStateProperty.all(EdgeInsets.all(8)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: WidgetStateProperty.fromMap({
          WidgetState.pressed: CircleBorder(),
          WidgetState.any: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        })
    )
);