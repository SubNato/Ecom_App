import 'package:ecom_app/pages/messages/chat/bloc/chat_events.dart';
import 'package:ecom_app/pages/messages/chat/bloc/chat_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBlocs extends Bloc<ChatEvents, ChatStates>{
  ChatBlocs():super(ChatStates()){
    on<TriggerMsgContentList>(_triggerMsgContentList);
    on<TriggerAddMsgContent>(_triggerAddMsgContent);
  }

  void _triggerMsgContentList(TriggerMsgContentList event, Emitter<ChatStates> emit){

  }

  void _triggerAddMsgContent(TriggerAddMsgContent event, Emitter<ChatStates> emit){

  }

}