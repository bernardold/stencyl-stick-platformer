package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

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

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
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

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

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



class SceneEvents_5 extends SceneScript
{
	
public var _shootingMachine1Killed:Bool;

public var _bridgeCreated:Bool;

public var _barrierRemoved:Bool;

public var _shootingMachine2Killed:Bool;

 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("shootingMachine1Killed", "_shootingMachine1Killed");
_shootingMachine1Killed = false;
nameMap.set("bridgeCreated", "_bridgeCreated");
_bridgeCreated = false;
nameMap.set("barrierRemoved", "_barrierRemoved");
_barrierRemoved = false;
nameMap.set("shootingMachine2Killed", "_shootingMachine2Killed");
_shootingMachine2Killed = false;

	}
	
	override public function init()
	{
		    
/* =========================== Keyboard =========================== */
addKeyStateListener("action2", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && pressed)
{
        if((!(_barrierRemoved) && (Engine.engine.getGameAttribute("haveEraser") && ((Engine.engine.getGameAttribute("PlayerXPosition") >= 435) && (Engine.engine.getGameAttribute("PlayerXPosition") <= 451)))))
{
            playSound(getSound(30));
            recycleActor(getActor(2));
            _barrierRemoved = true;
propertyChanged("_barrierRemoved", _barrierRemoved);
}

}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener("action2", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && pressed)
{
        if((_barrierRemoved && (!(_shootingMachine1Killed) && (Engine.engine.getGameAttribute("haveEraser") && ((Engine.engine.getGameAttribute("PlayerXPosition") >= 630) && (Engine.engine.getGameAttribute("PlayerXPosition") <= 650))))))
{
            playSound(getSound(30));
            recycleActor(getActor(3));
            _shootingMachine1Killed = true;
propertyChanged("_shootingMachine1Killed", _shootingMachine1Killed);
}

        if((_bridgeCreated && (!(_shootingMachine2Killed) && (Engine.engine.getGameAttribute("haveEraser") && ((Engine.engine.getGameAttribute("PlayerXPosition") >= 930) && (Engine.engine.getGameAttribute("PlayerXPosition") <= 950))))))
{
            playSound(getSound(30));
            recycleActor(getActor(4));
            _shootingMachine2Killed = true;
propertyChanged("_shootingMachine2Killed", _shootingMachine2Killed);
}

}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener("action1", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && pressed)
{
        if((_shootingMachine1Killed && (!(_bridgeCreated) && (Engine.engine.getGameAttribute("havePencil") && ((Engine.engine.getGameAttribute("PlayerXPosition") >= 710) && (Engine.engine.getGameAttribute("PlayerXPosition") <= 735))))))
{
            playSound(getSound(29));
            createRecycledActor(getActorType(3), 755, 536, Script.FRONT);
            _bridgeCreated = true;
propertyChanged("_bridgeCreated", _bridgeCreated);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}