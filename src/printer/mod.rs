#[cfg(feature = "vesa_1024x768")]
pub use self::vesa_1024x768::*;

#[cfg(feature = "vga_320x200")]
pub use self::vga_320x200::*;

#[cfg(not(any(feature = "vga_320x200", feature = "vesa_1024x768")))]
pub use self::vga_text_80x25::*;

#[cfg(feature = "vesa_1024x768")]
mod vesa_1024x768;

#[cfg(feature = "vga_320x200")]
mod vga_320x200;

#[cfg(not(any(feature = "vga_320x200", feature = "vesa_1024x768")))]
mod vga_text_80x25;
