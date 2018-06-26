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



class Design_22_22_HelpMessages extends SceneScript
{
	
public var _commandsMsg:String;

public var _pencilMsg:String;

public var _eraserMsg:String;

public var _crouchMsg:String;

 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("commandsMsg", "_commandsMsg");
_commandsMsg = "";
nameMap.set("pencilMsg", "_pencilMsg");
_pencilMsg = "";
nameMap.set("eraserMsg", "_eraserMsg");
_eraserMsg = "";
nameMap.set("crouchMsg", "_crouchMsg");
_crouchMsg = "";

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        _commandsMsg = "Use arrows <left> and <right> to move and <down> to crouch";
propertyChanged("_commandsMsg", _commandsMsg);
        _pencilMsg = "Use the Pencil <z> to draw a bridge on the dotted line";
propertyChanged("_pencilMsg", _pencilMsg);
        _eraserMsg = "Use the Eraser <x> to erase Barriers and Enemies";
propertyChanged("_eraserMsg", _eraserMsg);
        _crouchMsg = "Use crouch to dodge the bullets";
propertyChanged("_crouchMsg", _crouchMsg);
    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        g.setFont(getFont(35));
        /* "Commands Help at the beginning" */             if(Engine.engine.getGameAttribute("tutorialCommands"))
{
                g.drawString("" + _commandsMsg, ((getScreenWidth() / 2) - (g.font.font.getTextWidth(_commandsMsg)/Engine.SCALE / 2)), 270);
}

        /* "Pencil Help when picks up" */             if(Engine.engine.getGameAttribute("tutorialPencil"))
{
                g.drawString("" + _pencilMsg, ((getScreenWidth() / 2) - (g.font.font.getTextWidth(_pencilMsg)/Engine.SCALE / 2)), 270);
}

        /* "Eraser Help when picks it up" */             if(Engine.engine.getGameAttribute("tutorialEraser"))
{
                g.drawString("" + _eraserMsg, ((getScreenWidth() / 2) - (g.font.font.getTextWidth(_eraserMsg)/Engine.SCALE / 2)), 270);
}

        /* "Crouch Help on lvl 04" */             if(Engine.engine.getGameAttribute("tutorialCrouch"))
{
                g.drawString("" + _crouchMsg, ((getScreenWidth() / 2) - (g.font.font.getTextWidth(_crouchMsg)/Engine.SCALE / 2)), 270);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}