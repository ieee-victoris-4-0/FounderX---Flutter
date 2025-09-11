import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/roles_container.dart';

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
class SliderState{
}
class SliderValue extends SliderState{
  final double value;
  SliderValue({required this.value});
}
class RoleContainerState{
  final Drop drop;
  final String role;
  RoleContainerState({required this.drop, required this.role});
}
