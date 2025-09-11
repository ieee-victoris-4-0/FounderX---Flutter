import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/roles_container.dart';

class ButtonEvent{}
class EnableButtonEvent extends ButtonEvent{}
class DisableButtonEvent extends ButtonEvent{}
class SelectedEvent{
  final String choosenContainerField;
  SelectedEvent({required this.choosenContainerField});
}
class SelectContainerEvent extends SelectedEvent{
  SelectContainerEvent({required super.choosenContainerField});
}
class UnselectContainerEvent extends SelectedEvent{
  UnselectContainerEvent({required super.choosenContainerField});
}
class SliderEvent{
}
class SliderValueEvent extends SliderEvent{
  final double value;
  SliderValueEvent({required this.value});
}

class RoleContainerEvent{
  final Drop drop;
  final String role;
  RoleContainerEvent({required this.drop, required this.role});
}
