/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 7017E869
/// @DnDArgument : "var" "current_option"
/// @DnDArgument : "value" "obj_button_yes"
if(current_option == obj_button_yes)
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 3679FAD1
	/// @DnDApplyTo : {obj_hand}
	/// @DnDParent : 7017E869
	/// @DnDArgument : "x" "obj_button_no.x"
	/// @DnDArgument : "y" "y"
	with(obj_hand) {
	x = obj_button_no.x;
	y = y;
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 241D930D
	/// @DnDParent : 7017E869
	/// @DnDArgument : "expr" "obj_button_no"
	/// @DnDArgument : "var" "current_option"
	current_option = obj_button_no;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 7E846486
else
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 05CB1A59
	/// @DnDApplyTo : {obj_hand}
	/// @DnDParent : 7E846486
	/// @DnDArgument : "x" "obj_button_yes.x"
	/// @DnDArgument : "y" "y"
	with(obj_hand) {
	x = obj_button_yes.x;
	y = y;
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3F6C79E6
	/// @DnDParent : 7E846486
	/// @DnDArgument : "expr" "obj_button_yes"
	/// @DnDArgument : "var" "current_option"
	current_option = obj_button_yes;
}