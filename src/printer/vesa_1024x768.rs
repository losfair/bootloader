use core::fmt::{Result, Write};

pub struct Printer;

impl Printer {
    pub fn clear_screen(&mut self) {
    }
}

impl Write for Printer {
    fn write_str(&mut self, _s: &str) -> Result {
        Ok(())
    }
}
