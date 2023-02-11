<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\UrlType;


class ImagenType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder

            ->add('tituloImagen', TextType::class, array(
                'label' => 'Titulo Imagen',

            )
            )
            ->add('descripcion', TextareaType::class, array(
                'label' => 'Descripcion',
            )
            )
            ->add('url', UrlType::class, array(
                'label' => 'Url Imagen',
                'required' => true,

            )
            )

            ->add('archivo', FileType::class, array('label' => 'Imagen','required' => false,'data_class' => null));
       
    }
    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'App\Entity\Imagen'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_imagen';
    }


}
