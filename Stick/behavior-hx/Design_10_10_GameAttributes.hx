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



class Design_10_10_GameAttributes extends SceneScript
{
	
public var _pencil:Actor;

public var _eraser:Actor;

 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("pencil", "_pencil");
nameMap.set("eraser", "_eraser");

	}
	
	override public function init()
	{
		    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        g.setFont(getFont(18));
        /* "Show Items on the screen" */             g.drawString("" + "Items: ", 160, 20);
            if(Engine.engine.getGameAttribute("havePencil"))
{
                createRecycledActor(getActorType(7), (162 + g.font.font.getTextWidth("Items: ")/Engine.SCALE), 25, Script.FRONT);
                g.drawString("" + "<z>", (165 + ((getLastCreatedActor().getWidth()) + g.font.font.getTextWidth("Items: ")/Engine.SCALE)), 20);
}

            if(Engine.engine.getGameAttribute("haveEraser"))
{
                createRecycledActor(getActorType(9), (162 + g.font.font.getTextWidth("Items: ")/Engine.SCALE), 75, Script.FRONT);
                g.drawString("" + "<x>", (165 + ((getLastCreatedActor().getWidth()) + g.font.font.getTextWidth("Items: ")/Engine.SCALE)), 65);
}

        /* "Show level on the screen" */             g.drawString("" + "Level ", (600 - (g.font.font.getTextWidth("Level ")/Engine.SCALE / 2)), 20);
            g.drawString("" + Engine.engine.getGameAttribute("Level"), (600 + (g.font.font.getTextWidth("Level ")/Engine.SCALE / 2)), 20);
        /* "Show lifes on the screen" */             g.drawString("" + "Lifes:", (1100 - g.font.font.getTextWidth("Lifes: x")/Engine.SCALE), 20);
            g.drawString("" + Engine.engine.getGameAttribute("Life"), (1100 - g.font.font.getTextWidth("x")/Engine.SCALE), 20);
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}