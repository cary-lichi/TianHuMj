package blls._GamehallLogic 
{
	import blls.BaseLogic;
	import core.GameIF;
	import core.LogicManager;
	import laya.events.Event;
	import laya.utils.Ease;
	import laya.utils.Tween;
	import view.ActiveView.CertificationWindow;
	import view.ActiveView.PopUpDia;
	import view.AlphaWindowView;
	/**
	 * ...
	 * @author ...
	 */
	public class CertificationLogic extends BaseLogic
	{
		private var m_certificationWindow:CertificationWindow;
		private var m_alphaWindowView:AlphaWindowView;
		private var m_countDown:int;
		public function CertificationLogic() 
		{
			super();
		}
		public override function Init():void
		{
			if (m_certificationWindow == null)
			{
				m_certificationWindow = new CertificationWindow;
				m_certificationWindow.Init();
			}
			m_certificationWindow.visible = true;
			
			//注册所有按钮事件
			registerEventClick();
		}
		
		private function registerEventClick():void 
		{
			//关闭按钮
			m_certificationWindow.btn_close.on(Event.CLICK, this, btnCloseClick);
			//提交按钮
			m_certificationWindow.m_btnSubmit.on(Event.CLICK, this, onSubmitClicked);
			//获取验证码
			m_certificationWindow.m_btnCoed.on(Event.CLICK, this, onCoedClicked);
		}
		
		//获取验证码
		private function onCoedClicked(e:Event):void 
		{
			if (m_certificationWindow.m_btnCoed.text == "获取验证码")
			{
				var tel:String = m_certificationWindow.input_tel.text;
				if (tel.length == 0)
				{
					GameIF.GetPopUpDia("请输入手机号");
				}
				else 
				{
					var pattern:RegExp=/^[1][3,4,5,7,8][0-9]{9}$/;
					if (pattern.test(tel))
					{
						m_countDown = 60;
						m_certificationWindow.m_btnCoed.text = m_countDown.toString()+"S";
						Laya.timer.loop(1000, this, countDown);
					}
					else
					{
						GameIF.GetPopUpDia("您所输入的号码有误");	
					}
				}
			}
			else
			{
				GameIF.GetPopUpDia("验证码正在发送，请稍后点击");	
			}
		}
		
		//倒计时
		private function countDown():void 
		{
			
			m_countDown -=1;
			m_certificationWindow.m_btnCoed.text = m_countDown.toString()+"S";
			if (m_countDown < 0)
			{
				m_certificationWindow.m_btnCoed.text = "获取验证码";
				Laya.timer.clearAll(this);
			}	
		}
		//提交按钮
		private function onSubmitClicked(e:Event):void 
		{
			var tel:String = m_certificationWindow.input_tel.text; 
			var code:String = m_certificationWindow.input_code.text;
			var ID:String = m_certificationWindow.input_ID.text;
			var name:String = m_certificationWindow.input_name.text;
			
			//身份证正则表达式(15位) (javascirpt)
			var isIDCard1:RegExp=/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/; 
			//身份证正则表达式(18位) 
			var isIDCard2:RegExp =/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[X])$/;
			if (!isIDCard1.test(ID) && !isIDCard2.test(ID))
			{
				GameIF.GetPopUpDia("您输入的证件号有误");
			}
			else if (tel && code && ID && name)
			{
				GameIF.GetPopUpDia("恭喜你绑定成功,奖励你1张房卡",onIsOkClicked,this);
				
			}
			else
			{
				GameIF.GetPopUpDia("请填写完整信息");
			}
		}
		//重写提交按钮
		private function onIsOkClicked():void 
		{
			GameIF.DectiveLogic(LogicManager.CERTIFICATIONLOGIC);
			GameIF.ClosePopUpDia();
		}
		
		//显示飘字
		private function showSuccess(text:String):void 
		{
			GameIF.getInstance().uiManager.showTipsDia(m_certificationWindow.m_Success,m_certificationWindow.m_lableSuccess,text);
		}
		
		//关闭按钮点击事件
		private function btnCloseClick(e:Event):void 
		{
			GameIF.DectiveLogic(LogicManager.CERTIFICATIONLOGIC);
		}
		
		public override function Destroy():void
		{
			m_certificationWindow.Destroy();
			m_certificationWindow.destroy();
			m_certificationWindow.visible = false;
			m_certificationWindow = null;	
		}
		
		
	}

}