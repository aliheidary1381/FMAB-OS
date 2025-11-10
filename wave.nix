{
  home.file.".config/waveterm/presets.json".text = builtins.toJSON {
    "bg@default" = {
      "display:name" = "Default";
      "display:order" = -1;
      "bg:*" = true;
    };
    "bg@rainbow" = {
      "display:name" = "Rainbow";
      "display:order" = 2.1;
      "bg:*" = true;
      "bg" =
        "linear-gradient( 226.4deg,  rgba(255,26,1,1) 28.9%, rgba(254,155,1,1) 33%, rgba(255,241,0,1) 48.6%, rgba(34,218,1,1) 65.3%, rgba(0,141,254,1) 80.6%, rgba(113,63,254,1) 100.1% )";
      "bg:opacity" = 0.3;
    };
    "bg@green" = {
      "display:name" = "Green";
      "display:order" = 1.2;
      "bg:*" = true;
      "bg" = "green";
      "bg:opacity" = 0.3;
    };
    "bg@blue" = {
      "display:name" = "Blue";
      "display:order" = 1.1;
      "bg:*" = true;
      "bg" = "blue";
      "bg:opacity" = 0.3;
      "bg:activebordercolor" = "rgba(0, 0, 255, 1.0)";
    };
    "bg@red" = {
      "display:name" = "Red";
      "display:order" = 1.3;
      "bg:*" = true;
      "bg" = "red";
      "bg:opacity" = 0.3;
      "bg:activebordercolor" = "rgba(255, 0, 0, 1.0)";
    };
    "bg@ocean-depths" = {
      "display:name" = "Ocean Depths";
      "display:order" = 2.2;
      "bg:*" = true;
      "bg" = "linear-gradient(135deg, purple, blue, teal)";
      "bg:opacity" = 0.7;
    };
    "bg@aqua-horizon" = {
      "display:name" = "Aqua Horizon";
      "display:order" = 2.3;
      "bg:*" = true;
      "bg" =
        "linear-gradient(135deg, rgba(15, 30, 50, 1) 0%, rgba(40, 90, 130, 0.85) 30%, rgba(20, 100, 150, 0.75) 60%, rgba(0, 120, 160, 0.65) 80%, rgba(0, 140, 180, 0.55) 100%), linear-gradient(135deg, rgba(100, 80, 255, 0.4), rgba(0, 180, 220, 0.4)), radial-gradient(circle at 70% 70%, rgba(255, 255, 255, 0.05), transparent 70%)";
      "bg:opacity" = 0.85;
      "bg:blendmode" = "overlay";
    };
    "bg@sunset" = {
      "display:name" = "Sunset";
      "display:order" = 2.4;
      "bg:*" = true;
      "bg" = "linear-gradient(135deg, rgba(128, 0, 0, 1), rgba(255, 69, 0, 0.8), rgba(75, 0, 130, 1))";
      "bg:opacity" = 0.8;
      "bg:blendmode" = "normal";
    };
    "bg@enchantedforest" = {
      "display:name" = "Enchanted Forest";
      "display:order" = 2.7;
      "bg:*" = true;
      "bg" =
        "linear-gradient(145deg, rgba(0,50,0,1), rgba(34,139,34,0.7) 20%, rgba(0,100,0,0.5) 40%, rgba(0,200,100,0.3) 60%, rgba(34,139,34,0.8) 80%, rgba(0,50,0,1)), radial-gradient(circle at 30% 30%, rgba(255,255,255,0.1), transparent 80%), radial-gradient(circle at 70% 70%, rgba(255,255,255,0.1), transparent 80%)";
      "bg:opacity" = 0.8;
      "bg:blendmode" = "soft-light";
    };
    "bg@twilight-mist" = {
      "display:name" = "Twilight Mist";
      "display:order" = 2.9;
      "bg:*" = true;
      "bg" =
        "linear-gradient(180deg, rgba(60,60,90,1) 0%, rgba(90,110,140,0.8) 40%, rgba(120,140,160,0.6) 70%, rgba(60,60,90,1) 100%), radial-gradient(circle at 30% 40%, rgba(255,255,255,0.15), transparent 60%), radial-gradient(circle at 70% 70%, rgba(255,255,255,0.1), transparent 70%)";
      "bg:opacity" = 0.9;
      "bg:blendmode" = "soft-light";
    };
    "bg@duskhorizon" = {
      "display:name" = "Dusk Horizon";
      "display:order" = 3.1;
      "bg:*" = true;
      "bg" =
        "linear-gradient(0deg, rgba(128,0,0,1) 0%, rgba(204,85,0,0.7) 20%, rgba(255,140,0,0.6) 45%, rgba(160,90,160,0.5) 65%, rgba(60,60,120,1) 100%), radial-gradient(circle at 30% 30%, rgba(255,255,255,0.1), transparent 60%), radial-gradient(circle at 70% 70%, rgba(255,255,255,0.05), transparent 70%)";
      "bg:opacity" = 0.9;
      "bg:blendmode" = "overlay";
    };
    "bg@tropical-radiance" = {
      "display:name" = "Tropical Radiance";
      "display:order" = 3.3;
      "bg:*" = true;
      "bg" =
        "linear-gradient(135deg, rgba(204, 51, 255, 0.9) 0%, rgba(255, 85, 153, 0.75) 30%, rgba(255, 51, 153, 0.65) 60%, rgba(204, 51, 255, 0.6) 80%, rgba(51, 102, 255, 0.5) 100%), radial-gradient(circle at 30% 40%, rgba(255,255,255,0.1), transparent 60%), radial-gradient(circle at 70% 70%, rgba(255,255,255,0.05), transparent 70%)";
      "bg:opacity" = 0.9;
      "bg:blendmode" = "overlay";
    };
    "bg@twilight-ember" = {
      "display:name" = "Twilight Ember";
      "display:order" = 3.5;
      "bg:*" = true;
      "bg" =
        "linear-gradient(120deg,hsla(350, 65%, 57%, 1),hsla(30,60%,60%, .75), hsla(208,69%,50%,.15), hsl(230,60%,40%)),radial-gradient(at top right,hsla(300,60%,70%,0.3),transparent),radial-gradient(at top left,hsla(330,100%,70%,.20),transparent),radial-gradient(at top right,hsla(190,100%,40%,.20),transparent),radial-gradient(at bottom left,hsla(323,54%,50%,.5),transparent),radial-gradient(at bottom left,hsla(144,54%,50%,.25),transparent)";
      "bg:blendmode" = "overlay";
      "bg:text" = "rgb(200, 200, 200)";
    };
    "bg@cosmic-tide" = {
      "display:name" = "Cosmic Tide";
      "display:order" = 3.6;
      "bg:activebordercolor" = "#ff55aa";
      "bg:*" = true;
      "bg" = "linear-gradient(135deg, #00d9d9, #ff55aa, #1e1e2f, #2f3b57, #ff99ff)";
      "bg:opacity" = 0.6;
    };
    "bg@catpuccin-frappe" = {
      "display:name" = "Catpuccin Frappe";
      "display:order" = 0;
      "bg:*" = true;
      "bg:opacity" = 0.6;
      "bg:activebordercolor" = "#e5c890"; # accent = yellow
      "bg" = "#303446";
    };
    "bg@catpuccin-latte" = {
      "display:name" = "Catpuccin Latte";
      "display:order" = 1;
      "bg:*" = true;
      "bg:opacity" = 0.6;
      "bg:activebordercolor" = "#df8e1d"; # accent = yellow
      "bg" = "#eff1f5";
    };
  };

  home.file.".config/waveterm/termthemes.json".text = builtins.toJSON {
    "default-dark" = {
      "display:name" = "Default Dark";
      "display:order" = 2;
      "black" = "#757575";
      "red" = "#cc685c";
      "green" = "#76c266";
      "yellow" = "#cbca9b";
      "blue" = "#85aacb";
      "magenta" = "#cc72ca";
      "cyan" = "#74a7cb";
      "white" = "#c1c1c1";
      "brightBlack" = "#727272";
      "brightRed" = "#cc9d97";
      "brightGreen" = "#a3dd97";
      "brightYellow" = "#cbcaaa";
      "brightBlue" = "#9ab6cb";
      "brightMagenta" = "#cc8ecb";
      "brightCyan" = "#b7b8cb";
      "brightWhite" = "#f0f0f0";
      "gray" = "#8b918a";
      "cmdtext" = "#f0f0f0";
      "foreground" = "#c1c1c1";
      "selectionBackground" = "";
      "background" = "#000000";
      "cursor" = "";
    };
    "onedarkpro" = {
      "display:name" = "One Dark Pro";
      "display:order" = 3;
      "background" = "#21252B";
      "foreground" = "#ABB2BF";
      "cursor" = "#D7DAE0";
      "black" = "#3F4451";
      "red" = "#E06C75";
      "green" = "#98C379";
      "yellow" = "#D18F52";
      "blue" = "#61AFEF";
      "magenta" = "#C678DD";
      "cyan" = "#42B3C2";
      "white" = "#D7DAE0";
      "brightBlack" = "#4F5666";
      "brightRed" = "#FF616E";
      "brightGreen" = "#A5E075";
      "brightYellow" = "#F0A45D";
      "brightBlue" = "#4DC4FF";
      "brightMagenta" = "#DE73FF";
      "brightCyan" = "#4CD1E0";
      "brightWhite" = "#E6E6E6";
      "gray" = "#495162";
      "cmdtext" = "#ABB2BF";
    };
    "dracula" = {
      "display:name" = "Dracula";
      "display:order" = 4;
      "black" = "#21222C";
      "red" = "#FF5555";
      "green" = "#50FA7B";
      "yellow" = "#F1FA8C";
      "blue" = "#BD93F9";
      "magenta" = "#FF79C6";
      "cyan" = "#8BE9FD";
      "white" = "#F8F8F2";
      "brightBlack" = "#6272A4";
      "brightRed" = "#FF6E6E";
      "brightGreen" = "#69FF94";
      "brightYellow" = "#FFFFA5";
      "brightBlue" = "#D6ACFF";
      "brightMagenta" = "#FF92DF";
      "brightCyan" = "#A4FFFF";
      "brightWhite" = "#FFFFFF";
      "gray" = "#6272A4";
      "cmdtext" = "#F8F8F2";
      "foreground" = "#F8F8F2";
      "background" = "#282a36";
      "cursor" = "#f8f8f2";
    };
    "monokai" = {
      "display:name" = "Monokai";
      "display:order" = 5;
      "black" = "#1B1D1E";
      "red" = "#F92672";
      "green" = "#A6E22E";
      "yellow" = "#E6DB74";
      "blue" = "#66D9EF";
      "magenta" = "#AE81FF";
      "cyan" = "#A1EFE4";
      "white" = "#F8F8F2";
      "brightBlack" = "#75715E";
      "brightRed" = "#FD5FF1";
      "brightGreen" = "#A6E22E";
      "brightYellow" = "#E6DB74";
      "brightBlue" = "#66D9EF";
      "brightMagenta" = "#AE81FF";
      "brightCyan" = "#A1EFE4";
      "brightWhite" = "#F9F8F5";
      "gray" = "#75715E";
      "cmdtext" = "#F8F8F2";
      "foreground" = "#F8F8F2";
      "background" = "#272822";
      "cursor" = "#F8F8F2";
    };
    "campbell" = {
      "display:name" = "Campbell";
      "display:order" = 6;
      "black" = "#0C0C0C";
      "red" = "#C50F1F";
      "green" = "#13A10E";
      "yellow" = "#C19C00";
      "blue" = "#0037DA";
      "magenta" = "#881798";
      "cyan" = "#3A96DD";
      "white" = "#CCCCCC";
      "brightBlack" = "#767676";
      "brightRed" = "#E74856";
      "brightGreen" = "#16C60C";
      "brightYellow" = "#F9F1A5";
      "brightBlue" = "#3B78FF";
      "brightMagenta" = "#B4009E";
      "brightCyan" = "#61D6D6";
      "brightWhite" = "#F2F2F2";
      "gray" = "#767676";
      "cmdtext" = "#CCCCCC";
      "foreground" = "#CCCCCC";
      "selectionBackground" = "#3A96DD77";
      "background" = "#0C0C0C";
      "cursor" = "#CCCCCC";
    };
    "warmyellow" = {
      "display:name" = "Warm Yellow";
      "display:order" = 7;
      "black" = "#3C3228";
      "red" = "#E67E22";
      "green" = "#A5D6A7";
      "yellow" = "#F9D784";
      "blue" = "#7FB3D5";
      "magenta" = "#C39BD3";
      "cyan" = "#5DADE2";
      "white" = "#ECF0F1";
      "brightBlack" = "#7E705A";
      "brightRed" = "#E74C3C";
      "brightGreen" = "#82E0AA";
      "brightYellow" = "#F4D03F";
      "brightBlue" = "#3498DB";
      "brightMagenta" = "#9B59B6";
      "brightCyan" = "#1ABC9C";
      "brightWhite" = "#FFFFFF";
      "background" = "#2B2620";
      "foreground" = "#F2E6D4";
      "selectionBackground" = "#B7950B77";
      "cursor" = "#F9D784";
    };
    "rosepine" = {
      "display:name" = "Rose Pine";
      "display:order" = 8;
      "black" = "#26233a";
      "red" = "#eb6f92";
      "green" = "#3e8fb0";
      "yellow" = "#f6c177";
      "blue" = "#9ccfd8";
      "magenta" = "#c4a7e7";
      "cyan" = "#ebbcba";
      "white" = "#e0def4";
      "brightBlack" = "#908caa";
      "brightRed" = "#ff8cab";
      "brightGreen" = "#9ccfb0";
      "brightYellow" = "#ffd196";
      "brightBlue" = "#bee6e0";
      "brightMagenta" = "#e2c4ff";
      "brightCyan" = "#ffd1d0";
      "brightWhite" = "#fffaf3";
      "gray" = "#908caa";
      "cmdtext" = "#e0def4";
      "foreground" = "#e0def4";
      "background" = "#191724";
      "cursor" = "#524f67";
    };
    "catpuccin-frappe" = {
      "display:name" = "Catpuccin Frappe";
      "display:order" = 0;
      "black" = "#51576d";
      "red" = "#e78284";
      "green" = "#a6d189";
      "yellow" = "#ef9f76";
      "blue" = "#8caaee";
      "magenta" = "#ca9ee6";
      "cyan" = "#81c8be";
      "white" = "#b5bfe2";
      "brightBlack" = "#626880";
      "brightRed" = "#ea999c";
      "brightGreen" = "#a6d189";
      "brightYellow" = "#e5c890";
      "brightBlue" = "#85c1dc";
      "brightMagenta" = "#f4b8e4";
      "brightCyan" = "#99d1db";
      "brightWhite" = "#a5adce";
      "gray" = "#737994";
      "cmdtext" = "#838ba7";
      "foreground" = "#c6d0f5";
      "background" = "#303446";
      "cursor" = "#f2d5cf";
    };
    "catpuccin-latte" = {
      "display:name" = "Catpuccin Latte";
      "display:order" = 1;
      "black" = "#bcc0cc";
      "red" = "#d20f39";
      "green" = "#40a02b";
      "yellow" = "#df8e1d";
      "blue" = "#1e66f5";
      "magenta" = "#8839ef";
      "cyan" = "#179299";
      "white" = "#5c5f77";
      "brightBlack" = "#acb0be";
      "brightRed" = "#e64553";
      "brightGreen" = "#40a02b";
      "brightYellow" = "#df8e1d";
      "brightBlue" = "#209fb5";
      "brightMagenta" = "#ea76cb";
      "brightCyan" = "#04a5e5";
      "brightWhite" = "#ccd0da";
      "gray" = "#9ca0b0";
      "cmdtext" = "#8c8fa1";
      "foreground" = "#4c4f69";
      "background" = "#eff1f5";
      "cursor" = "#dc8a78";
    };
  };

  home.file.".config/waveterm/settings.json".text = builtins.toJSON {
    "app:defaultnewblock" = "term";
    "autoupdate:enabled" = true;
    "autoupdate:installonquit" = true;
    "autoupdate:intervalms" = 3600000;
    "conn:askbeforewshinstall" = true;
    "conn:wshenabled" = true;
    "editor:minimapenabled" = true;
    "web:defaulturl" = "https://github.com/wavetermdev/waveterm";
    "web:defaultsearch" = "https://www.google.com/search?q={query}";
    "window:tilegapsize" = 3;
    "window:maxtabcachesize" = 10;
    "window:nativetitlebar" = true;
    "window:magnifiedblockopacity" = 0.6;
    "window:magnifiedblocksize" = 0.9;
    "window:magnifiedblockblurprimarypx" = 10;
    "window:magnifiedblockblursecondarypx" = 2;
    "window:confirmclose" = true;
    "window:savelastwindow" = true;
    "telemetry:enabled" = true;
    "term:copyonselect" = true;
    "tab:preset" = "catpuccin-frappe";
    "term:theme" = "catpuccin-frappe";
    "term:fontsize" = 16;
    "ai:preset" = "ai@gemma3n";
  };

  home.file.".config/waveterm/presets/ai.json".text = builtins.toJSON {
    "ai@gemma3n" = {
      "display:name" = "Gemma 3n (e2b-it-q4_K_M)";
      "display:order" = 1;
      "ai:*" = true;
      "ai:baseurl" = "http://localhost:11434/v1";
      "ai:name" = "gemma3n";
      "ai:model" = "gemma3n:e2b-it-q4_K_M";
      "ai:apitoken" = "ollama"; # doesn't matter. it's ignored
    };
    "ai@qwen3-think" = {
      "display:name" = "Qwen3 thinking (4b-thinking-2507-q4_K_M)";
      "display:order" = 2;
      "ai:*" = true;
      "ai:baseurl" = "http://localhost:11434/v1";
      "ai:name" = "qwen3";
      "ai:model" = "qwen3:4b-thinking-2507-q4_K_M";
      "ai:apitoken" = "ollama"; # doesn't matter. it's ignored
    };
    "ai@qwen3-instruct" = {
      "display:name" = "Qwen3 instruct (4b-instruct-2507-q4_K_M)";
      "display:order" = 3;
      "ai:*" = true;
      "ai:baseurl" = "http://localhost:11434/v1";
      "ai:name" = "qwen3";
      "ai:model" = "qwen3:4b-instruct-2507-q4_K_M";
      "ai:apitoken" = "ollama"; # doesn't matter. it's ignored
    };
  };
}
