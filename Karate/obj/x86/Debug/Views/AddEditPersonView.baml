   M S B A M L   `   `   `  ����
  Karate$    Karate.Views.AddEditPersonView   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5        � 	Resources  5	         ValidatingTextBox �� 
TargetType �� Property �� Value-  'System.Windows.Input.KeyboardNavigation �� 
TargetType �� CornerRadius �� Padding ��Name �� Triggers	 P� Property
 P� Value �� 
TargetName �� Triggers �� Self �� RelativeSource �� Path��%�  &	        �� 5
   
   " ��6*   .�5      ��  �@J�SnapsToDevicePixels . 64   �� 5       �@�OverridesDefaultStyle . 66   �� 5       �@ TabNavigation$
 None=�6A   �� 5       �@�FocusVisualStyle 61   Z� �� 5       � ��$	 120��6)   �� 5       � ��$ 20��6*   �� 5       �@J�	AllowDrop . 6*   �� 5       �@=�ErrorTemplate 69   Z� �� 5       � �� 5      �� 5      " ��6&   .R�5      �� $��Border��5      $ 5��5      $ 2q�5      
�������
���   �$��2q�5      ._�5      �� $ PART_ContentHost��66   $��0q�6+   66   5       5      P� 5       	 � {�
 .  . �5!   "   �� $ Border��6)    � ��
 �����6S   �� 5"   "   $ Border��6)    � ��
 �   �6T   �� 5#   "    � ��
 �����6?   5$      P� 5%      	 �@=�HasError
 . . �5&   "   �� $ Border��6)    � ��
 �  ��5'   %   5(      5*      5,       5-      P� 5.      	 �@=�HasError
 . . �5/      ��  �@�ToolTip 50      �� # Z $2 ,(Validation.Errors).CurrentItem.ErrorContent�52      54      57      .��58      �  � RowDefinitions 59   
   �� 5:      $��40 �6   �� 5;      $��40 �6   �� 5<      $��40 �6   .+�5?   
   �� $��0��6   $��5q�6"    �� Orientation$ 
Horizontal=�6-   .+�5@      �� $
��Name��6   $��Normal"�6#   $��11(�67   $	��100��6E   �� 5A      $��Normal"�6   $��11(�6*   $	��150��68   $��10,0,0,0q�6D   #��[  5E      ��5B      �� $$ current_person.name.data_value� �� UpdateSourceTrigger$ 	LostFocus=� �� ValidatesOnDataErrors .  �� ValidatesOnExceptions . {�5F      �� $$ current_person.name.IsEditable�5G      �� 5I   
   $��1��6   $��5q�6"   $ 
Horizontal=�6-   .+�5J      �� $��Address��6   $��Normal"�6&   $��11(�6:   $	��100��6H   �� 5K      $��Normal"�6   $��11(�6*   $	��150��68   $��10,0,0,0q�6D   #��[  5O      ��5L      �� $' !current_person.address.data_value�$ 	LostFocus=� .  . {�5P      �� $' !current_person.address.IsEditable�5Q      �� 5S   
   $��2��6   $ 
Horizontal=�6"   $	��Top=�6;   $��40,0,0,0q�5T      .+�5U      �� $
��Save��6   $��Center=�6$   $��Center=�5V      $��0,0,0,0q�6#   $��90��5W      $��30��6   ��5X      �� *save_person_command+�� 5Y      $
��Edit��6   $��Center=�6$   $��Center=�5Z      $��10,0,0,0q�6#   $��90��5[      $��30��6   ��5\      �� *edit_person_command+�� 5]      $��Cancel��6   $��Center=�6&   $��Center=�5^      $��10,0,0,0q�6#   $��90��5_      $��30��6   ��5`      �� *cancel_person_command+5b      5c      5d      