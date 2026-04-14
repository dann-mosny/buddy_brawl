extends Node2D


func play_level_music():
	var music_player = GlobalMusicPlayer.get_node("AudioStreamPlayer")
	music_player.stream = load("res://sound_effects/Music/pot-theme.ogg")
	music_player.play()


func stop_level_music():
	var music_player = GlobalMusicPlayer.get_node("AudioStreamPlayer")
	music_player.stop()


func play_menu_music():
	var music_player = GlobalMusicPlayer.get_node("MenuMusicStreamPlayer")
	music_player.stream = load("res://sound_effects/Music/bckg-song.ogg")
	music_player.play()


func stop_menu_music():
	var music_player = GlobalMusicPlayer.get_node("MenuMusicStreamPlayer")
	music_player.stop()
