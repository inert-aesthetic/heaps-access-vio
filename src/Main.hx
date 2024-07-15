import haxe.ui.containers.Box;

class Main extends hxd.App{
	static function main()  {
		new Main();
	}

	override public function init(){
		super.init();
        hxd.Res.initLocal();
        haxe.ui.Toolkit.init({root:s2d});
		haxe.ui.core.Screen.instance.addComponent(new MainView());
	}
}

@:xml('
	<box width="100%" height="100%">
		<image resource="SVG_Logo.svg"/>
	</box>
')
class MainView extends Box{
	public function new(){
		super();
	}
}

@:keep @:keepSub
class ConvertSVGtoPNG extends hxd.fs.Convert {
	override function convert() {
		var size = hasParam("size") ? getParam("size") : 128;
		switch(Sys.systemName()){
			case "Windows":
				command("msdfgen.exe", ["-svg", srcPath, "-size", '$size', '$size', "-autoframe", "-o", dstPath]);
			case "Linux":
				command("inkscape", [srcPath, "-o", dstPath]);
			default:
				throw("No SVG to PNG converter specified.");
		}
	}

	static var _ = hxd.fs.Convert.register(new ConvertSVGtoPNG("svg", "png"));
}
