/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0E6A343D
/// @DnDArgument : "var" "puede_cerrar_juego"
/// @DnDArgument : "value" "true"
if(puede_cerrar_juego == true)
{
	/// @DnDAction : YoYo Games.Rooms.Next_Room
	/// @DnDVersion : 1
	/// @DnDHash : 0D0D98B7
	/// @DnDParent : 0E6A343D
	room_goto_next();
}