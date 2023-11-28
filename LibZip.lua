--
-- Main Premake5 file for building ziplib project.
-- Copyright (c) 2023 by Danil (Kenny) Dukhovenko, All rights reserved.
-- 
-- Requirement:
--  - ForceEngine.lua
--  - zlib installed (via VCPKG)
--

-- libzip C Project
project "LibZip"
	kind          "StaticLib"
	language      "C"
	cppdialect    "C++17"
	staticruntime "On"
	targetdir     ("%{ForceDir.BinLib}/" .. BuildDir .. "/%{prj.name}/Lib")
	objdir        ("%{ForceDir.BinLib}/" .. BuildDir .. "/%{prj.name}/Obj")

	files {
		"src/zip_add.c",
		"src/zip_add_dir.c",
		"src/zip_add_entry.c",
		"src/zip_algorithm_deflate.c",
		"src/zip_buffer.c",
		"src/zip_close.c",
		"src/zip_delete.c",
		"src/zip_dir_add.c",
		"src/zip_dirent.c",
		"src/zip_discard.c",
		"src/zip_entry.c",
		"src/zip_error.c",
		"src/zip_error_clear.c",
		"src/zip_error_get.c",
		"src/zip_error_get_sys_type.c",
		"src/zip_error_strerror.c",
		"src/zip_error_to_str.c",
		"src/zip_extra_field.c",
		"src/zip_extra_field_api.c",
		"src/zip_fclose.c",
		"src/zip_fdopen.c",
		"src/zip_file_add.c",
		"src/zip_file_error_clear.c",
		"src/zip_file_error_get.c",
		"src/zip_file_get_comment.c",
		"src/zip_file_get_external_attributes.c",
		"src/zip_file_get_offset.c",
		"src/zip_file_rename.c",
		"src/zip_file_replace.c",
		"src/zip_file_set_comment.c",
		"src/zip_file_set_external_attributes.c",
		"src/zip_file_set_encryption.c",
		"src/zip_file_set_mtime.c",
		"src/zip_file_strerror.c",
		"src/zip_fopen.c",
		"src/zip_fopen_encrypted.c",
		"src/zip_fopen_index.c",
		"src/zip_fopen_index_encrypted.c",
		"src/zip_fread.c",
		"src/zip_fseek.c",
		"src/zip_ftell.c",
		"src/zip_get_archive_comment.c",
		"src/zip_get_archive_flag.c",
		"src/zip_get_encryption_implementation.c",
		"src/zip_get_file_comment.c",
		"src/zip_get_name.c",
		"src/zip_get_num_entries.c",
		"src/zip_get_num_files.c",
		"src/zip_hash.c",
		"src/zip_io_util.c",
		"src/zip_libzip_version.c",
		"src/zip_memdup.c",
		"src/zip_name_locate.c",
		"src/zip_new.c",
		"src/zip_open.c",
		"src/zip_pkware.c",
		"src/zip_progress.c",
		"src/zip_rename.c",
		"src/zip_replace.c",
		"src/zip_set_archive_comment.c",
		"src/zip_set_archive_flag.c",
		"src/zip_set_default_password.c",
		"src/zip_set_file_comment.c",
		"src/zip_set_file_compression.c",
		"src/zip_set_name.c",
		"src/zip_source_accept_empty.c",
		"src/zip_source_begin_write.c",
		"src/zip_source_begin_write_cloning.c",
		"src/zip_source_buffer.c",
		"src/zip_source_call.c",
		"src/zip_source_close.c",
		"src/zip_source_commit_write.c",
		"src/zip_source_compress.c",
		"src/zip_source_crc.c",
		"src/zip_source_error.c",
		"src/zip_source_file_common.c",
		"src/zip_source_file_stdio.c",
		"src/zip_source_free.c",
		"src/zip_source_function.c",
		"src/zip_source_get_file_attributes.c",
		"src/zip_source_is_deleted.c",
		"src/zip_source_layered.c",
		"src/zip_source_open.c",
		"src/zip_source_pass_to_lower_layer.c",
		"src/zip_source_pkware_decode.c",
		"src/zip_source_pkware_encode.c",
		"src/zip_source_read.c",
		"src/zip_source_remove.c",
		"src/zip_source_rollback_write.c",
		"src/zip_source_seek.c",
		"src/zip_source_seek_write.c",
		"src/zip_source_stat.c",
		"src/zip_source_supports.c",
		"src/zip_source_tell.c",
		"src/zip_source_tell_write.c",
		"src/zip_source_window.c",
		"src/zip_source_winzip_aes_decode.c",
		"src/zip_source_winzip_aes_encode.c",
		"src/zip_source_write.c",
		"src/zip_source_zip.c",
		"src/zip_source_zip_new.c",
		"src/zip_stat.c",
		"src/zip_stat_index.c",
		"src/zip_stat_init.c",
		"src/zip_strerror.c",
		"src/zip_string.c",
		"src/zip_unchange.c",
		"src/zip_unchange_all.c",
		"src/zip_unchange_archive.c",
		"src/zip_unchange_data.c",
		"src/zip_utf-8.c",
		"src/zip_winzip_aes.c",
		"src/zip_err_str.c",
		
		"include/zip_source_file_stdio.h",
		"include/zip_source_file.h",
		"include/zipconf.h",
		"include/zipint.h",
		"include/compat.h",
		"include/getopt.h",
		"include/config.h",
		"include/zip.h"
	}
	
	includedirs {
		"include",
		
		-- Zlib
		"%{IncludeDir.ZLib}"
	}
	
	defines {
		"BUILDING_LIBZIP",
		"HAVE_CONFIG_H",
		"_CRT_SECURE_NO_WARNINGS",
		"_CRT_NONSTDC_NO_DEPRECATE",
		"ZIP_STATIC"
	}

	filter "system:windows"
		systemversion "latest"
		
		files {
			"include/zip_source_file_win32.h",
			"include/zip_crypto_win.h",
			"src/zip_crypto_win.c",
			"src/zip_random_win32.c",
			"src/zip_source_file_win32.c",
			"src/zip_source_file_win32_ansi.c",
			"src/zip_source_file_win32_named.c",
			"src/zip_source_file_win32_utf8.c",
			"src/zip_source_file_win32_utf16.c"
		}

	filter "system:linux"
		pic "On"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"