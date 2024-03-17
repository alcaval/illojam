/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2235EA27
/// @DnDArgument : "code" "x=clamp(x,450,1400);$(13_10)/// @description Inserte aquí la descripción$(13_10)// Puede escribir su código en este editor$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)"
x=clamp(x,450,1400);
/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 4200FBE4
/// @DnDArgument : "var" "x"
/// @DnDArgument : "op" "4"
/// @DnDArgument : "value" "1000"
if(x >= 1000)
{
	/// @DnDAction : YoYo Games.Rooms.Next_Room
	/// @DnDVersion : 1
	/// @DnDHash : 01FEFBED
	/// @DnDParent : 4200FBE4
	room_goto_next();
}