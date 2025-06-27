## RSPS Singleplayer (530 Revision)

Fork of 2009Scape client and server packaged for singleplayer use.

- Bundled JRE included; no separate Java installation required.

## Usage

1. Run `launch_server.bat` to start the server.  
2. Run `launch_client.bat` to start the client.

## Structure

- `/game/` - server, client and related data files.
- `/resources/` - plugins.
- `/jre/` - embedded Java runtime.

## Sources

- Server: https://gitlab.com/rspsdev/530-server
- Client: https://gitlab.com/2009scape

## Links

- Editor: https://github.com/szumaster3/cache-editor

# FAQ

## Admin Mode

To enable admin mode:
1. Open `game/worldprops/default.conf`.
2. Change `noauth_default_admin = false` to `true`.

## Skip Tutorial Island (Temporary)

1. Start a conversation with the Guide.
2. Move to interrupt/close the dialogue interface.
3. Type the command `::exit`.

***

*Non-commercial preservation project. Original content belongs to respective owners.*
