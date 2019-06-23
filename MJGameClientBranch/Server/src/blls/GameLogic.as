package blls 
{
	import laya.utils.Browser;
	import network.NetworkManager;
	/**
	 * ...
	 * @author ...
	 */
	public class GameLogic extends BaseLogic
	{
		
		public function GameLogic() 
		{
			super();
		}
		
		public override function Init():void
		{
			//var n:Network = new Network;
			//n.Init();
			//m_ProtoBuf.load("protobuf/msg.proto",testProto);
			//testProto();
			
		}
		
		//public function CreateProtoMessage(err:*, root:*):*
		//{
			//if (err){
				//throw  err;
			//}
			//
			//NetworkManager.Msg = root.lookup("Msg");
			//trace(NetworkManager.Msg);
			//
			//
			////return message;
			////= Network.Msg.encode(message).finish();
			////Network.m_socket.send(buffer);
		//}
		
		//public override function OnReceiveMessage(message:*):void
		//{
			////得到消息，判断消息是不是对自己有用的。再进行操作
			////if(type)
		//}
		
		//public override function CreateProtoMessage():void
		//{
			//
			////处理完数据之后，向服务器发送。。
			////Network.SocketSendMeeage
		//}
		//
		public override function Destroy():void
		{
			
		}
	}

}