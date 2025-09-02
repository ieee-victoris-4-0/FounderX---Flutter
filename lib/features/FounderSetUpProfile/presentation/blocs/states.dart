class ButtonState{
}
class EnabledButtonState extends ButtonState{

}
class DisabledButtonState extends ButtonState{
}
class SelectedContainerState{
  final String choosenContainerField;
  SelectedContainerState({required this.choosenContainerField});
}
class Selected extends SelectedContainerState{
  Selected({required super.choosenContainerField});
}
class Unselected extends SelectedContainerState{
  Unselected({required super.choosenContainerField});
}

