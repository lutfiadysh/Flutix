part of 'widgets.dart';

class SelectableBox extends StatelessWidget {
  final bool isSelected;
  final bool isEnabled;
  final double width;
  final double height;
  final String text;
  final Function OnTap;
  final TextStyle textStyle;

  SelectableBox(
      this.text,
      {this.isEnabled = true ,
      this.isSelected = false,
      this.width = 144,
      this.height =  60,
      this.textStyle,
      this.OnTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(OnTap != null){
          OnTap();
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: (!isEnabled)
              ? Color(0xFFE4E4E4)
              : isSelected
              ? accentColor2
              : Colors.transparent,
          border: Border.all(color: (!isEnabled)
              ? Color(0xFFE4E4E4) : isSelected
              ? Colors.transparent : Color(0xFFE4E4E4))
        ),
        child: Center(
          child: Text(text ?? "None",style: (textStyle ?? blackTextFont).copyWith(fontSize: 16,fontWeight: FontWeight.w400),),
        ),
      ),
    );
  }
}
