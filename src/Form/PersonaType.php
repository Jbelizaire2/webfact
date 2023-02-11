<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\FileType;

class PersonaType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('name')
                ->add('lastName')
                ->add('rut')
                ->add('gender', ChoiceType::class, array(
                    'choices' => array('f' => 'Femenino', 'm' => 'Masculino'),
                    'required' => true,
                    'label' => 'Sexo',
                    'attr' => array('placeholder' => 'Sexo')
                ))
                ->add('mail', EmailType::class, array(
                    'required' => true,
                    'label' => 'Correo Electrónico',
                    'attr' => array('placeholder' => 'Correo Electrónico')
                )) 
                ->add('phone')
              ;
    }/**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'App\Entity\Persona'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_persona';
    }


}
