/**
 * ...
 * @author dawenhao
 */



//conch.showLoadingView( false );
//var pCanvas = window.document.createElement( "canvas" );
//pCanvas.width=window.innerWidth;
//pCanvas.height = window.innerHeight;
//document.body.appendChild( pCanvas );
//var pContext = pCanvas.getContext("2d");

//var pImg = window.document.createElement("img");
//pImg.onload=function()
//{	
	//pImg.bLoaded = true;
	//Init(this);
//}
//pImg.src="Avatar.jpg";
//
//function Init( pImage )
//{
	//window.pGraphics = new ConchGraphics();
	//window.pGraphics.drawImageM( pImage,0,0,pImage.width,pImage.height,0,0,256,256,null );
//
	//
	//window.pNode1 = new ConchNode();
	//pNode1.setRootNode();
	//pNode1.pos(0,0);
//
	//window.pNode2 = new ConchNode();
	//pNode2.pos(300,300);
	//pNode2.size(256,256);
	//pNode2.pivot(128,128);
	//pNode1.addChildAt(pNode2,0);
	//pNode2.graphics(window.pGraphics);
	//
	//window.pNode3 = new ConchNode();
	//pNode3.pos(0,0);
	//pNode1.addChildAt(pNode3,1);
	//
//}
//var i = 0;
//function onDrawFrame()
//{
	//if( window.pNode2 )
	//{
		//window.pNode2.rotate( i++ );
	//}
//}
//setInterval(onDrawFrame, 15);
//
//document.addEventListener( "touchstart",function(e)
//{
	//conch.captureScreen(function(arrayBuff,width,height){
		//conch.saveAsPng( arrayBuff,width,height,conch.getCachePath()+"/test.png" );
		//window.globalImage = window.document.createElement("img");
		//window.globalImage.onload=function()
		//{
			//alert(">>>onload");
			//window.pGraphics1 = new ConchGraphics();
			//window.pGraphics1.drawImageM( globalImage,0,0,globalImage.width,globalImage.height,0,0,256,256,null );
			//window.pNode3.graphics(window.pGraphics1);
		//}
		//window.globalImage.src = "file:///" + conch.getCachePath()+"/test.png";
		//
		///*
		//globalImage.putImageData(arrayBuff,width,height);
		//window.pGraphics1 = new ConchGraphics();
		//window.pGraphics1.drawImageM( globalImage,0,0,globalImage.width,globalImage.height,0,0,256,256,null );
		//window.pNode3.graphics(window.pGraphics1);
		//*/
	//});
//});
//document.addEventListener( "mousedown",function(e)
//{
	//var buffer = new ArrayBuffer(512*512*4);
	//var uint8 = new Uint8Array(buffer);
	//for (var i=0; i<uint8.length; i++) {
		//uint8[i] = 255;
	//}
	//window.globalImage = window.document.createElement("img");
	//globalImage.putImageData(buffer,512,512);
	//window.pGraphics1 = new ConchGraphics();
	//window.pGraphics1.drawImageM( globalImage,0,0,globalImage.width,globalImage.height,0,0,256,256,null );
	//window.pNode3.graphics(window.pGraphics1);
//});
//
function getBase64Image(){
		//var canvas = document.getElementById('layaCanvas');
	//var dataUrl = canvas.toDataURL("image/png");
	////alert("dataUrl"+dataUrl);
	//return dataUrl;
	if( window.conch )
	{
		
		window.conch.captureScreen(function(arrayBuff,width,height)
		{
			alert("开始截图");
			//alert(arrayBuff);
			//alert(conch.getCachePath());
			//存储文件的方式
			//conch.saveAsPng(arrayBuff,width,height,conch.getCachePath()+"/test.png" );
			var jpg = conch.convertBitmapToJpeg(arrayBuff,width,height);
			//alert(jpg);
			fs_writeFileSync(conch.getCachePath()+"/test.jpg");
			
			var png = conch.convertBitmapToPng(arrayBuff,width,height);
			fs_writeFileSync(conch.getCachePath()+"/test.png");
			//window.globalImage = window.document.createElement("img");
			//window.globalImage.onload=function()
			//{
				//
			//}
			//window.globalImage.src = "file:///" + conch.getCachePath()+"/test.png";
			
			//window.image = window.document.createElement("img");
			//image.putImageData(arrayBuff,width,height);
		
		});	
	}
}