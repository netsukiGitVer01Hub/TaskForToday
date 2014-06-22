/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package fileexplorer;
import javax.swing.ImageIcon;

/**
 *
 * @author m
 */
public class FileExplorer {

    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String iconuri;
        //iconuri = "/User/m/Documents/NetBeansProjects/FileExplorer/src/fileexplorer/img/icon.png";
        iconuri = "src/fileexplorer/img/icon.png";
        MainFrameView frame = new MainFrameView("いいよねー");
        ImageIcon icon = new ImageIcon(iconuri);
        
        
        frame.setIconImage(icon.getImage());
       
        frame.setVisible(true);
        
        
    }
    
}
