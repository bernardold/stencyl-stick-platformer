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



class Design_2_2_StickManWalk extends ActorScript
{          	
	
public var _WalkSpeed:Float;

public var _WalkRight:String;

public var _WalkLeft:String;

public var _StopRight:String;

public var _StopLeft:String;

public var _CrouchRight:String;

public var _CrouchLeft:String;

public var _hit:Bool;
    
/* ========================= Custom Event ========================= */
public function _customEvent_disableHelp1():Void
{
        if(Engine.engine.getGameAttribute("tutorialCommands"))
{
            Engine.engine.setGameAttribute("tutorialCommands", false);
}

}

    
/* ========================= Custom Event ========================= */
public function _customEvent_disableHelp2():Void
{
        if(Engine.engine.getGameAttribute("tutorialCrouch"))
{
            Engine.engine.setGameAttribute("tutorialCrouch", false);
}

}


 
 	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
nameMap.set("WalkSpeed", "_WalkSpeed");
_WalkSpeed = 7.0;
nameMap.set("WalkRight", "_WalkRight");
nameMap.set("WalkLeft", "_WalkLeft");
nameMap.set("StopRight", "_StopRight");
nameMap.set("StopLeft", "_StopLeft");
nameMap.set("CrouchRight", "_CrouchRight");
nameMap.set("CrouchLeft", "_CrouchLeft");
nameMap.set("hit", "_hit");
_hit = false;

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        _WalkRight = ("" + "WalkRight");
propertyChanged("_WalkRight", _WalkRight);
        _WalkLeft = "WalkLeft";
propertyChanged("_WalkLeft", _WalkLeft);
        _StopRight = "HoldPositionRight";
propertyChanged("_StopRight", _StopRight);
        _StopLeft = "HoldPositionLeft";
propertyChanged("_StopLeft", _StopLeft);
        _CrouchRight = "CrouchRight";
propertyChanged("_CrouchRight", _CrouchRight);
        _CrouchLeft = "CrouchLeft";
propertyChanged("_CrouchLeft", _CrouchLeft);
    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if(isKeyDown("right"))
{
            _customEvent_disableHelp1();
            actor.setAnimation("" + _WalkRight);
}

        else if(isKeyDown("left"))
{
            _customEvent_disableHelp1();
            actor.setAnimation("" + _WalkLeft);
}

        else if(isKeyDown("down"))
{
            _customEvent_disableHelp2();
            if(((actor.getAnimation() == _WalkRight) || (actor.getAnimation() == _StopRight)))
{
                actor.setAnimation("" + _CrouchRight);
}

            else if(((actor.getAnimation() == _WalkLeft) || (actor.getAnimation() == _StopLeft)))
{
                actor.setAnimation("" + _CrouchLeft);
}

}

        else
{
            if(((actor.getAnimation() == _WalkRight) || (actor.getAnimation() == _CrouchRight)))
{
                actor.setAnimation("" + _StopRight);
}

            else if(((actor.getAnimation() == _WalkLeft) || (actor.getAnimation() == _CrouchLeft)))
{
                actor.setAnimation("" + _StopLeft);
}

}

}
});
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if(isKeyDown("right"))
{
            actor.setXVelocity(_WalkSpeed);
}

        else if(isKeyDown("left"))
{
            actor.setXVelocity(-(_WalkSpeed));
}

        else
{
            actor.setXVelocity(0);
}

        Engine.engine.setGameAttribute("PlayerXPosition", actor.getScreenX());
}
});
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if(((Engine.engine.getGameAttribute("Level") % 2) == 1))
{
            if((actor.getScreenX() <= 0))
{
                actor.setX(0);
}

            if((actor.getScreenX() >= 1130))
{
                actor.setX(1130);
}

}

        else if(((Engine.engine.getGameAttribute("Level") % 2) == 0))
{
            if((actor.getScreenX() <= 130))
{
                actor.setX(130);
}

            if((actor.getScreenX() >= (1280 - (actor.getWidth()))))
{
                actor.setX((1280 - (actor.getWidth())));
}

}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}