package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	
	var tiles:FlxTilemap;
	var player:FlxSprite;
	
	override public function create():Void
	{
		bgColor = 0xff5aa8b2;
		
		tiles = new FlxTilemap();
		tiles.loadMapFromCSV("assets/data/map.csv", "assets/images/autotiles.png", 16, 16, AUTO);
		
		player = new FlxSprite(FlxG.width * 0.5, FlxG.height * 0.5);
		player.makeGraphic(16, 24, 0xffa2324e);
		
		player.acceleration.y = 980;
		
		add(tiles);
		add(player);
	}

	override public function update(elapsed:Float):Void
	{
		player.velocity.x = 0;
		if (FlxG.keys.pressed.LEFT) player.velocity.x -= 200;
		if (FlxG.keys.pressed.RIGHT) player.velocity.x += 200;
		
		if (player.isTouching(FlxObject.FLOOR) && FlxG.keys.justPressed.SPACE) player.velocity.y = -300;
		
		super.update(elapsed);
		FlxG.collide(tiles, player);
	}
}