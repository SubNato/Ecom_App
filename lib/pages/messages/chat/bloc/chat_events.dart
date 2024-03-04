import 'package:ecom_app/entities/entities.dart';
import 'package:equatable/equatable.dart';

abstract class ChatEvents extends Equatable{     //Equatable is useful for emitting a lot of states and trigger a lot of events
  const ChatEvents();

  @override
  List<Object> get props => [];
}

class TriggerMsgContentList extends ChatEvents{
  const TriggerMsgContentList(this.msgContent);
  final Msgcontent msgContent;

  @override
  List<Object> get props => [msgContent];
}

class TriggerAddMsgContent extends ChatEvents{
  const TriggerAddMsgContent(this.msgContent);
  final Msgcontent msgContent;

  @override
  List<Object> get props => [msgContent];
}