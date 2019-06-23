package blls._GamehallLogic 
{
	import blls.BaseLogic;
	import core.GameIF;
	import core.LogicManager;
	import laya.events.Event;
	import laya.ui.HScrollBar;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Tween;
	import view.ActiveView.AddWXWindow;
	import view.AlphaWindowView;
	
	/**
	 * ...
	 * @author ...
	 */
	public class AddWXLogic extends BaseLogic 
	{
		private var m_addWXWindow:AddWXWindow;
		private var m_nBarValue:Number;

		public function AddWXLogic() 
		{
			super();
		}
		
		public override function Init():void
		{

			if (m_addWXWindow == null)
			{
				m_addWXWindow = new AddWXWindow;
				m_addWXWindow.Init();
			}
			m_addWXWindow.visible = true;
			
			//注册所有按钮事件
			registerEventClick();
			
			m_addWXWindow.m_panel.hScrollBarSkin = "";
			m_addWXWindow.m_panel.on(Event.MOUSE_UP, this, onPanelChange);
			m_addWXWindow.m_panel.on(Event.MOUSE_OUT, this, onPanelChange);
			//m_addWXWindow.m_panel.hScrollBar.changeHandler = new Handler(this, onPanelChange);
		//	m_addWXWindow.m_panel.hScrollBar.stopScroll();
		}
		
		//轮播图
		private function onPanelChange(e:*):void 
		{
			if (e.target.name == "imgCarousel")
			{
				e.target.hScrollBar.stopScroll()
				m_nBarValue = e.target.hScrollBar.value;
				trace("value:"+m_nBarValue);
				if (m_nBarValue <= 250)
				{
					m_nBarValue = 0;
					Tween.to(e.target.hScrollBar, { "value":m_nBarValue}, 300);
				}
				else if (m_nBarValue > 250 && m_nBarValue <= 755)
				{
					m_nBarValue = 505;
					Tween.to(e.target.hScrollBar, { "value":m_nBarValue}, 300);
				}
				else if (m_nBarValue > 755 && m_nBarValue <= 1260)
				{
					m_nBarValue = 1010;
					Tween.to(e.target.hScrollBar, { "value":m_nBarValue}, 300);
				}
				else if (m_nBarValue > 1260)
				{
					m_nBarValue = 1515;
					Tween.to(e.target.hScrollBar, { "value":m_nBarValue}, 300);
				}
				Laya.timer.once(500, this, CarouselChange);
			}
		}
		//切换界面
		private function CarouselChange():void 
		{
			var index:int = m_nBarValue / 505;
			m_addWXWindow.m_tab.selectedIndex = index;
			m_addWXWindow.m_imgTittle.skin = "gameHall/img_Bubble_" + index + ".png";
			m_addWXWindow.m_imgText.skin = "gameHall/img_txt_" + index + ".png";
			
		}
		
		private function registerEventClick():void 
		{
			//关闭按钮
			m_addWXWindow.btn_close.on(Event.CLICK, this, btnCloseClick);
			//一键复制
			m_addWXWindow.m_btnCopy.on(Event.CLICK, this, onCopyClicked);
			//tab
			m_addWXWindow.m_tab.selectHandler=new Handler(this,onSelecte);  
		}
		//tab改变
		private function onSelecte(index:int):void 
		{
			m_nBarValue = index*505;
			Tween.to(m_addWXWindow.m_panel.hScrollBar, { "value":m_nBarValue}, 300);
			Laya.timer.once(500, this, CarouselChange);
		}
		
		//一键复制
		private function onCopyClicked():void 
		{
			GameIF.getInstance().uiManager.showTipsDia(m_addWXWindow.m_Success,m_addWXWindow.m_lableSuccess,"复制成功");
		}

		//关闭按钮点击事件
		private function btnCloseClick():void 
		{
			GameIF.DectiveLogic(LogicManager.ADDWXLOGIC);
		}
		
		public override function Destroy():void
		{
			m_addWXWindow.Destroy();
			m_addWXWindow.destroy();
			m_addWXWindow.visible = false;
			m_addWXWindow = null;	
		}
		
	}

}