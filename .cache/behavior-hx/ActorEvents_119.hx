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



class ActorEvents_119 extends ActorScript
{
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		
	}
	
	override public function init()
	{
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				if((((Engine.engine.getGameAttribute("Answered22") : Bool) == false) && ((Engine.engine.getGameAttribute("Answered24") : Bool) == false)))
				{
					if(((Engine.engine.getGameAttribute("QuestionMenuLv1") : Bool) == false))
					{
						if(((Engine.engine.getGameAttribute("Correct_8") : Bool) == false))
						{
							Engine.engine.setGameAttribute("PlateClick", false);
							actor.growTo(110/100, 110/100, 0, Easing.linear);
							actor.setFilter([createTintFilter(Utils.getColorRGB(255,255,51), 50/100)]);
						}
					}
				}
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				if((((Engine.engine.getGameAttribute("Answered22") : Bool) == false) && ((Engine.engine.getGameAttribute("Answered24") : Bool) == false)))
				{
					if(((Engine.engine.getGameAttribute("QuestionMenuLv1") : Bool) == false))
					{
						if(((Engine.engine.getGameAttribute("Correct_8") : Bool) == false))
						{
							Engine.engine.setGameAttribute("PlateClick", true);
							actor.growTo(100/100, 100/100, 0, Easing.linear);
							actor.clearFilters();
						}
					}
				}
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((Engine.engine.getGameAttribute("QuestionMenuLv1") : Bool) == true))
				{
					if(((Engine.engine.getGameAttribute("Answered22") : Bool) == true))
					{
						Engine.engine.setGameAttribute("QuestionMenuLv1", false);
						runLater(1000 * 2, function(timeTask:TimedTask):Void
						{
							actor.sendToBack();
							actor.growTo(100/100, 100/100, 0.5, Easing.linear);
							actor.moveTo(123, 50, 0.5, Easing.linear);
							Engine.engine.setGameAttribute("Answered22", false);
						}, actor);
					}
					else if(((Engine.engine.getGameAttribute("Answered23") : Bool) == true))
					{
						Engine.engine.setGameAttribute("QuestionMenuLv1", false);
						Engine.engine.setGameAttribute("Correct_8", true);
						runLater(1000 * 2, function(timeTask:TimedTask):Void
						{
							actor.sendToBack();
							actor.alpha = 50 / 100;
							actor.growTo(100/100, 100/100, 0.5, Easing.linear);
							actor.moveTo(123, 50, 0.5, Easing.linear);
							Engine.engine.setGameAttribute("Answered23", false);
						}, actor);
					}
					else if(((Engine.engine.getGameAttribute("Answered24") : Bool) == true))
					{
						Engine.engine.setGameAttribute("QuestionMenuLv1", false);
						runLater(1000 * 2, function(timeTask:TimedTask):Void
						{
							actor.sendToBack();
							actor.growTo(100/100, 100/100, 0.5, Easing.linear);
							actor.moveTo(123, 50, 0.5, Easing.linear);
							Engine.engine.setGameAttribute("Answered24", false);
						}, actor);
					}
				}
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((((Engine.engine.getGameAttribute("Answered22") : Bool) == false) && ((Engine.engine.getGameAttribute("Answered24") : Bool) == false)))
				{
					if(((Engine.engine.getGameAttribute("Correct_8") : Bool) == false))
					{
						if(((Engine.engine.getGameAttribute("QuestionMenuLv1") : Bool) == false))
						{
							Engine.engine.setGameAttribute("QuestionMenuLv1", true);
							Engine.engine.setGameAttribute("PlateClick", false);
							actor.bringToFront();
							actor.growTo(200/100, 200/100, 0.5, Easing.linear);
							actor.clearFilters();
							actor.moveTo(30, 100, 0.5, Easing.linear);
							createRecycledActor(getActorType(9), 0, 0, Script.MIDDLE);
							getLastCreatedActor().alpha = 10 / 100;
							runLater(1000 * 1, function(timeTask:TimedTask):Void
							{
								createRecycledActor(getActorType(121), 800, 50, Script.FRONT);
								runLater(1000 * 0.5, function(timeTask:TimedTask):Void
								{
									createRecycledActor(getActorType(123), 800, 150, Script.FRONT);
									runLater(1000 * 0.5, function(timeTask:TimedTask):Void
									{
										createRecycledActor(getActorType(125), 800, 250, Script.FRONT);
										runLater(1000 * 0.5, function(timeTask:TimedTask):Void
										{
											createRecycledActor(getActorType(127), 800, 350, Script.FRONT);
										}, actor);
									}, actor);
								}, actor);
							}, actor);
						}
					}
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}