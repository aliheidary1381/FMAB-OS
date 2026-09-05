{ pkgs, ... }:

let
  ini = pkgs.formats.ini { };
in
{
  xdg.configFile."okularpartrc-frappe".source = ini.generate "okularpartrc-frappe" {
    "Dlg Accessibility" = {
      RecolorBackground = "48,52,70";
      RecolorForeground = "198,208,245";
    };
    Document = {
      ChangeColors = true;
      RenderMode = "Recolor";
    };
    General = {
      ShellOpenFileInTabs = true;
      ttsVoice = "samantha";
    };
    "Main View" = {
      ShowLeftPanel = false;
    };
    PageView = {
      MouseMode = "TextSelect";
    };
    Reviews = {
      DrawingTools = ''<tool name="Red"><engine color="#e78284"><annotation color="#e78284" type="Ink" width="2"/></engine></tool>,<tool name="Green"><engine color="#a6d189"><annotation color="#a6d189" type="Ink" width="2"/></engine></tool>,<tool name="Blue"><engine color="#8caaee"><annotation color="#8caaee" type="Ink" width="2"/></engine></tool>,<tool name="Yellow"><engine color="#e5c890"><annotation color="#e5c890" type="Ink" width="2"/></engine></tool>,<tool name="Black"><engine color="#f2d5cf"><annotation color="#f2d5cf" type="Ink" width="2"/></engine></tool>,<tool name="White"><engine color="#232634"><annotation color="#232634" type="Ink" width="2"/></engine></tool>'';
      QuickAnnotationTools = ''<tool id="1" name="Yellow Highlighter" type="highlight"><engine color="#ffe5c890" type="TextSelector"><annotation color="#ffe5c890" type="Highlight"/></engine><shortcut>1</shortcut></tool>,<tool id="2" name="Green Highlighter" type="highlight"><engine color="#ffa6d189" type="TextSelector"><annotation color="#ffa6d189" type="Highlight"/></engine><shortcut>2</shortcut></tool>,<tool id="3" type="underline"><engine color="#ffe78284" type="TextSelector"><annotation color="#ffe78284" type="Underline"/></engine><shortcut>3</shortcut></tool>,<tool id="4" name="Insert Text" type="typewriter"><engine block="true" type="PickPoint"><annotation color="#00ffffff" textColor="#c6d0f5" type="Typewriter" width="0"/></engine><shortcut>4</shortcut></tool>,<tool id="5" type="note-inline"><engine block="true" color="#fff2d5cf" hoverIcon="tool-note-inline" type="PickPoint"><annotation color="#fff2d5cf" type="FreeText" width="1"/></engine><shortcut>5</shortcut></tool>,<tool id="6" type="note-linked"><engine color="#fff2d5cf" hoverIcon="tool-note" type="PickPoint"><annotation color="#fff2d5cf" icon="Note" type="Text"/></engine><shortcut>6</shortcut></tool>'';
    };
  };

  xdg.configFile."okularpartrc-latte".source = ini.generate "okularpartrc-latte" {
    "Dlg Accessibility" = {
      RecolorBackground = "239,241,245";
      RecolorForeground = "76,79,105";
    };
    Document = {
      ChangeColors = true;
      RenderMode = "Recolor";
    };
    General = {
      ShellOpenFileInTabs = true;
      ttsVoice = "samantha";
    };
    "Main View" = {
      ShowLeftPanel = false;
    };
    PageView = {
      MouseMode = "TextSelect";
    };
    Reviews = {
      DrawingTools = ''<tool name="Red"><engine color="#d20f39"><annotation color="#d20f39" type="Ink" width="2"/></engine></tool>,<tool name="Green"><engine color="#40a02b"><annotation color="#40a02b" type="Ink" width="2"/></engine></tool>,<tool name="Blue"><engine color="#1e66f5"><annotation color="#1e66f5" type="Ink" width="2"/></engine></tool>,<tool name="Yellow"><engine color="#df8e1d"><annotation color="#df8e1d" type="Ink" width="2"/></engine></tool>,<tool name="Black"><engine color="#dc8a78"><annotation color="#dc8a78" type="Ink" width="2"/></engine></tool>,<tool name="White"><engine color="#dce0e8"><annotation color="#dce0e8" type="Ink" width="2"/></engine></tool>'';
      QuickAnnotationTools = ''<tool id="1" name="Yellow Highlighter" type="highlight"><engine color="#ffdf8e1d" type="TextSelector"><annotation color="#ffdf8e1d" type="Highlight"/></engine><shortcut>1</shortcut></tool>,<tool id="2" name="Green Highlighter" type="highlight"><engine color="#ff40a02b" type="TextSelector"><annotation color="#ff40a02b" type="Highlight"/></engine><shortcut>2</shortcut></tool>,<tool id="3" type="underline"><engine color="#ffd20f39" type="TextSelector"><annotation color="#ffd20f39" type="Underline"/></engine><shortcut>3</shortcut></tool>,<tool id="4" name="Insert Text" type="typewriter"><engine block="true" type="PickPoint"><annotation color="#00ffffff" textColor="#4c4f69" type="Typewriter" width="0"/></engine><shortcut>4</shortcut></tool>,<tool id="5" type="note-inline"><engine block="true" color="#ffdc8a78" hoverIcon="tool-note-inline" type="PickPoint"><annotation color="#ffdc8a78" type="FreeText" width="1"/></engine><shortcut>5</shortcut></tool>,<tool id="6" type="note-linked"><engine color="#ffdc8a78" hoverIcon="tool-note" type="PickPoint"><annotation color="#ffdc8a78" icon="Note" type="Text"/></engine><shortcut>6</shortcut></tool>'';
    };
  };
}
