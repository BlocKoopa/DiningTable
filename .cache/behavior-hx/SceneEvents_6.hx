package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;
import com.stencyl.graphics.ScaleMode;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Config;
import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.motion.*;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class SceneEvents_6 extends SceneScript
{
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		loopSound(getSound(138));
		Engine.engine.setGameAttribute("RandomQuestionValue", randomInt(1, 3));
		runLater(1000 * 1, function(timeTask:TimedTask):Void
		{
			createRecycledActor(getActorType(149), 484, 245, Script.MIDDLE);
			getLastCreatedActor().growTo(100/100, 100/100, 0, Easing.linear);
			createRecycledActor(getActorType(191), 314, 156, Script.MIDDLE);
			getLastCreatedActor().growTo(25/100, 25/100, 0, Easing.linear);
			createRecycledActor(getActorType(161), 375, 174, Script.BACK);
			getLastCreatedActor().growTo(25/100, 25/100, 0, Easing.linear);
			createRecycledActor(getActorType(171), 441, 340, Script.MIDDLE);
			getLastCreatedActor().growTo(100/100, 100/100, 0, Easing.linear);
			createRecycledActor(getActorType(139), 382, -186, Script.MIDDLE);
			getLastCreatedActor().growTo(10/100, 10/100, 0, Easing.linear);
			createRecycledActor(getActorType(151), 558, 270, Script.MIDDLE);
			getLastCreatedActor().growTo(100/100, 100/100, 0, Easing.linear);
			createRecycledActor(getActorType(201), 358, 58, Script.MIDDLE);
			getLastCreatedActor().growTo(25/100, 20/100, 0, Easing.linear);
			createRecycledActor(getActorType(213), 86, -82, Script.MIDDLE);
			getLastCreatedActor().growTo(50/100, 50/100, 0, Easing.linear);
		}, null);
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				g.setFont(getFont(137));
				g.drawString("" + "Score:", 750, 20);
				g.drawString("" + (Engine.engine.getGameAttribute("Score") : Float), 800, 20);
				Script.setDrawingLayerToActorLayer(getActor(1));
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((Engine.engine.getGameAttribute("Score") : Float) >= 8))
				{
					runLater(1000 * 2.5, function(timeTask:TimedTask):Void
					{
						switchScene(GameModel.get().scenes.get(7).getID(), null, createCrossfadeTransition(0));
						Engine.engine.setGameAttribute("Score", 0);
						Engine.engine.setGameAttribute("Correct_1", false);
						Engine.engine.setGameAttribute("Correct_2", false);
						Engine.engine.setGameAttribute("Correct_3", false);
						Engine.engine.setGameAttribute("Correct_4", false);
						Engine.engine.setGameAttribute("Correct_5", false);
						Engine.engine.setGameAttribute("Correct_6", false);
						Engine.engine.setGameAttribute("Correct_7", false);
						Engine.engine.setGameAttribute("Correct_8", false);
					}, null);
				}
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((Engine.engine.getGameAttribute("Correct_3") : Bool) == true))
				{
					Engine.engine.setGameAttribute("Correct_3", false);
					createRecycledActor(getActorType(181), 441, 340, Script.MIDDLE);
					getLastCreatedActor().growTo(100/100, 100/100, 0, Easing.linear);
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}