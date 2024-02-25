/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 7B3F2F2F
/// @DnDArgument : "var" "current_option"
/// @DnDArgument : "value" "obj_button_yes"
if(current_option == obj_button_yes)
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 11C42817
	/// @DnDApplyTo : {obj_hand}
	/// @DnDParent : 7B3F2F2F
	/// @DnDArgument : "x" "obj_button_no.x"
	/// @DnDArgument : "y" "y"
	with(obj_hand) {
	x = obj_button_no.x;
	y = y;
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 67E7482E
	/// @DnDParent : 7B3F2F2F
	/// @DnDArgument : "expr" "obj_button_no"
	/// @DnDArgument : "var" "current_option"
	current_option = obj_button_no;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 4D3163B0
else
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 44347E58
	/// @DnDApplyTo : {obj_hand}
	/// @DnDParent : 4D3163B0
	/// @DnDArgument : "x" "obj_button_yes.x"
	/// @DnDArgument : "y" "y"
	with(obj_hand) {
	x = obj_button_yes.x;
	y = y;
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 67CDD401
	/// @DnDParent : 4D3163B0
	/// @DnDArgument : "expr" "obj_button_yes"
	/// @DnDArgument : "var" "current_option"
	current_option = obj_button_yes;
}