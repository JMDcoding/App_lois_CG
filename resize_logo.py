import os
from PIL import Image

def resize_logo():
    logo_path = 'assets/images/logo/logo.jpeg'
    padded_logo_path = 'assets/images/logo/logo_padded.jpeg'
    
    # Open original image
    img = Image.open(logo_path)
    
    # Target scale is 70% (which means 30% padding)
    scale_factor = 0.70
    
    width, height = img.size
    new_width = int(width * scale_factor)
    new_height = int(height * scale_factor)
    
    # Resize the image
    resized_img = img.resize((new_width, new_height), Image.Resampling.LANCZOS)
    
    # Create a new white background image of the original size
    background = Image.new('RGB', (width, height), (255, 255, 255))
    
    # Calculate position to paste the resized image in the center
    paste_x = (width - new_width) // 2
    paste_y = (height - new_height) // 2
    
    # Paste
    background.paste(resized_img, (paste_x, paste_y))
    
    # Save the new padded logo
    background.save(padded_logo_path, quality=100)
    print(f"Padded logo saved to {padded_logo_path}")

if __name__ == "__main__":
    resize_logo()
