import { Button, Card, CardActions, CardContent, Grid, Grow, Paper, Typography } from "@mui/material";
import Footer from "../components/Footer";
import Nav from "../components/Nav";

export const ClassChooser = () => {


    return (
        <>
            <Nav/>
            <Paper style={{  padding:"3rem 6rem"}} elevation={2} >
            <Typography style={{marginBottom:"1rem"}} variant="h3" color="primary">Válasszon osztályt!</Typography>
            
                
                <Grid container spacing={2}>

            {
            Array(10).fill(1).map((el, i) => {
                return (
                    <Grid item xs={12} sm={6} md={3} >
                      
           <Grow
          in={true}
          style={{ transformOrigin: '0 0 0' }}
          timeout={1500}
        >

<Card  sx={{ minWidth: 150 }}>
      <CardContent>
        <Typography variant="h5"  gutterBottom>
          Osztály neve
        </Typography>
        <Typography variant="h5" >
          Végzési év
        </Typography>
        <Typography color="text.secondary">
          Iskola neve
        </Typography>
      </CardContent>
      <CardActions>
        <Button sx={{ fontWeight: 'bold' }} href="home">Tovább</Button>
      </CardActions>
    </Card>
    </Grow>
    </Grid>
    
    )
            }
            )

            }
            </Grid>
            
            </Paper>
            <Footer trademark versionNumber />
        </>
    );
  };